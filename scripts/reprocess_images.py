#!/usr/bin/env python3
"""
Reprocess Heritage Site Images

Downloads missing images from existing URLs or Google Custom Search API,
and generates drawable files for all heritage sites.
"""

import os
import re
import sys
import time
import sqlite3
import logging
import argparse
import requests
from pathlib import Path
from typing import Optional, Tuple, List
from io import BytesIO

try:
    from PIL import Image
except ImportError:
    print("Error: PIL (Pillow) is required. Install with: pip install Pillow")
    sys.exit(1)

try:
    from googleapiclient.discovery import build
    GOOGLE_API_AVAILABLE = True
except ImportError:
    print("Warning: google-api-python-client not installed. Google search will not be available.")
    print("Install with: pip install google-api-python-client")
    GOOGLE_API_AVAILABLE = False

# Setup logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s'
)
logger = logging.getLogger(__name__)


class ImageProcessor:
    """Handles image downloading and processing for heritage sites"""

    def __init__(self, db_path: str, drawable_dir: str,
                 google_api_key: Optional[str] = None,
                 google_search_engine_id: Optional[str] = None,
                 min_width: int = 800, min_height: int = 600):
        self.db_path = Path(db_path)
        self.drawable_dir = Path(drawable_dir)
        self.google_api_key = google_api_key
        self.google_search_engine_id = google_search_engine_id
        self.min_width = min_width
        self.min_height = min_height

        # Ensure drawable directory exists
        self.drawable_dir.mkdir(parents=True, exist_ok=True)

        # Statistics
        self.stats = {
            'total': 0,
            'skipped_has_drawable': 0,
            'downloaded_from_uri': 0,
            'downloaded_from_google': 0,
            'failed': 0
        }

    @staticmethod
    def to_drawable_resource_name(site_name: str) -> str:
        """Convert site name to drawable resource name (matches Kotlin logic)"""
        sanitized = re.sub(r'[^a-z0-9]', '', site_name.lower())
        if sanitized and sanitized[0].isdigit():
            return f"a{sanitized}"
        return sanitized

    def check_drawable_exists(self, site_name: str) -> Tuple[bool, Optional[Path]]:
        """Check if drawable file exists for the site"""
        resource_name = self.to_drawable_resource_name(site_name)

        # Check .jpg first
        jpg_path = self.drawable_dir / f"{resource_name}.jpg"
        if jpg_path.exists():
            return True, jpg_path

        # Check .png
        png_path = self.drawable_dir / f"{resource_name}.png"
        if png_path.exists():
            return True, png_path

        return False, None

    def download_image(self, url: str, site_name: str) -> Tuple[bool, Optional[Path], Optional[str]]:
        """
        Download image from URL to drawable folder
        Returns: (success, file_path, error_message)
        """
        resource_name = self.to_drawable_resource_name(site_name)
        output_path = self.drawable_dir / f"{resource_name}.jpg"

        try:
            # Download with retry
            for attempt in range(3):
                try:
                    response = requests.get(
                        url,
                        stream=True,
                        timeout=30,
                        headers={'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36'}
                    )
                    if response.status_code == 200:
                        break
                    time.sleep(2 ** attempt)
                except requests.RequestException as e:
                    if attempt == 2:
                        raise
                    time.sleep(2 ** attempt)
            else:
                return False, None, f"HTTP {response.status_code}"

            # Load and verify image
            img = Image.open(BytesIO(response.content))
            width, height = img.size

            # Check minimum dimensions
            if width < self.min_width or height < self.min_height:
                return False, None, f"Image too small: {width}x{height}"

            # Convert to RGB if necessary
            if img.mode not in ('RGB', 'L'):
                img = img.convert('RGB')

            # Save image
            img.save(output_path, 'JPEG', quality=85, optimize=True)

            logger.info(f"  Downloaded: {output_path.name} ({width}x{height})")
            return True, output_path, None

        except Exception as e:
            return False, None, str(e)

    def search_google_images(self, site_name: str) -> Optional[str]:
        """
        Search Google for high-quality images of the heritage site
        Returns: Image URL or None
        """
        if not GOOGLE_API_AVAILABLE:
            logger.warning("  Google API not available (package not installed)")
            return None

        if not self.google_api_key or not self.google_search_engine_id:
            logger.warning("  Google API credentials not provided")
            return None

        try:
            service = build("customsearch", "v1", developerKey=self.google_api_key)

            # Search query
            query = f'"{site_name}" unesco world heritage site'

            # Execute search
            result = service.cse().list(
                q=query,
                cx=self.google_search_engine_id,
                searchType='image',
                imgSize='xlarge',
                imgType='photo',
                num=5  # Get top 5 results
            ).execute()

            # Get first valid image URL
            if 'items' in result:
                for item in result['items']:
                    if 'link' in item:
                        url = item['link']
                        # Skip UNESCO URLs
                        if 'unesco.org' not in url.lower():
                            logger.info(f"  Found Google image: {url[:80]}...")
                            return url

            logger.warning(f"  No suitable images found on Google for: {site_name}")
            return None

        except Exception as e:
            logger.error(f"  Google search error: {e}")
            return None

    def process_entry(self, entry_id: int, site_name: str, full_image_uri: Optional[str]) -> bool:
        """
        Process a single entry: check drawable, download if needed
        Returns: True if successful, False otherwise
        """
        logger.info(f"[{entry_id}] {site_name}")

        # Check if drawable already exists
        has_drawable, drawable_path = self.check_drawable_exists(site_name)
        if has_drawable:
            logger.info(f"  [SKIP] Drawable exists: {drawable_path.name}")
            self.stats['skipped_has_drawable'] += 1
            return True

        # Try to download from existing URI
        if full_image_uri:
            urls = [url.strip() for url in full_image_uri.split(',')]
            for url in urls:
                if not url or url.lower().startswith('http') is False:
                    continue

                logger.info(f"  Trying URL: {url[:80]}...")
                success, path, error = self.download_image(url, site_name)

                if success:
                    self.stats['downloaded_from_uri'] += 1
                    return True
                else:
                    logger.warning(f"  Failed: {error}")

        # Fall back to Google search
        logger.info("  Searching Google Images...")
        google_url = self.search_google_images(site_name)

        if google_url:
            success, path, error = self.download_image(google_url, site_name)
            if success:
                self.stats['downloaded_from_google'] += 1
                # Update database with new URL
                self.update_image_uri(entry_id, google_url)
                return True
            else:
                logger.error(f"  Failed to download Google image: {error}")

        # Failed to get image
        logger.error(f"  [FAILED] No image available")
        self.stats['failed'] += 1
        return False

    def update_image_uri(self, entry_id: int, image_url: str):
        """Update database with new image URI"""
        try:
            conn = sqlite3.connect(self.db_path)
            cursor = conn.cursor()
            cursor.execute("""
                UPDATE museum_item
                SET full_image_uri = ?
                WHERE id = ?
            """, (image_url, entry_id))
            conn.commit()
            conn.close()
            logger.info(f"  Updated database with new URI")
        except Exception as e:
            logger.error(f"  Failed to update database: {e}")

    def process_all(self, limit: Optional[int] = None):
        """Process all entries in the database"""
        conn = sqlite3.connect(self.db_path)
        cursor = conn.cursor()

        # Query all entries
        query = "SELECT id, paintingname, full_image_uri FROM museum_item ORDER BY id"
        if limit:
            query += f" LIMIT {limit}"

        cursor.execute(query)
        entries = cursor.fetchall()
        conn.close()

        self.stats['total'] = len(entries)
        logger.info(f"Processing {len(entries)} entries...\n")

        for entry_id, site_name, full_image_uri in entries:
            try:
                self.process_entry(entry_id, site_name, full_image_uri)
            except Exception as e:
                logger.error(f"[{entry_id}] Unexpected error: {e}")
                self.stats['failed'] += 1

            # Small delay to avoid rate limiting
            time.sleep(0.5)

        # Print statistics
        self.print_stats()

    def print_stats(self):
        """Print processing statistics"""
        logger.info("\n" + "="*60)
        logger.info("PROCESSING STATISTICS")
        logger.info("="*60)
        logger.info(f"Total entries:           {self.stats['total']}")
        logger.info(f"Skipped (has drawable):  {self.stats['skipped_has_drawable']}")
        logger.info(f"Downloaded from URI:     {self.stats['downloaded_from_uri']}")
        logger.info(f"Downloaded from Google:  {self.stats['downloaded_from_google']}")
        logger.info(f"Failed:                  {self.stats['failed']}")
        logger.info("="*60)


def main():
    parser = argparse.ArgumentParser(description='Reprocess heritage site images')
    parser.add_argument('--db', type=str, help='Path to heritage_sites.db')
    parser.add_argument('--drawable-dir', type=str, help='Path to drawable-nodpi directory')
    parser.add_argument('--google-api-key', type=str, help='Google API key (or use GOOGLE_API_KEY env var)')
    parser.add_argument('--google-search-engine-id', type=str, help='Google Search Engine ID (or use GOOGLE_SEARCH_ENGINE_ID env var)')
    parser.add_argument('--limit', type=int, help='Limit number of entries to process (for testing)')
    parser.add_argument('--min-width', type=int, default=800, help='Minimum image width (default: 800)')
    parser.add_argument('--min-height', type=int, default=600, help='Minimum image height (default: 600)')

    args = parser.parse_args()

    # Default paths
    script_dir = Path(__file__).parent
    db_path = args.db or script_dir.parent / "androidApp" / "src" / "main" / "assets" / "heritage_sites.db"
    drawable_dir = args.drawable_dir or script_dir.parent / "androidApp" / "src" / "main" / "res" / "drawable-nodpi"

    # Get Google API credentials
    google_api_key = args.google_api_key or os.environ.get('GOOGLE_API_KEY')
    google_search_engine_id = args.google_search_engine_id or os.environ.get('GOOGLE_SEARCH_ENGINE_ID')

    # Validate paths
    if not Path(db_path).exists():
        logger.error(f"Database not found: {db_path}")
        sys.exit(1)

    # Show configuration
    logger.info("="*60)
    logger.info("CONFIGURATION")
    logger.info("="*60)
    logger.info(f"Database:        {db_path}")
    logger.info(f"Drawable dir:    {drawable_dir}")
    logger.info(f"Google API:      {'Enabled' if google_api_key else 'Disabled (no API key)'}")
    logger.info(f"Min dimensions:  {args.min_width}x{args.min_height}")
    if args.limit:
        logger.info(f"Limit:           {args.limit} entries")
    logger.info("="*60 + "\n")

    if not google_api_key:
        logger.warning("Google API key not provided. Only existing URIs will be used.")
        logger.warning("Set GOOGLE_API_KEY environment variable or use --google-api-key flag.\n")

    # Create processor and run
    processor = ImageProcessor(
        db_path=str(db_path),
        drawable_dir=str(drawable_dir),
        google_api_key=google_api_key,
        google_search_engine_id=google_search_engine_id,
        min_width=args.min_width,
        min_height=args.min_height
    )

    processor.process_all(limit=args.limit)


if __name__ == "__main__":
    main()
