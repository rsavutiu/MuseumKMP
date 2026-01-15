"""
Image Validation and Download

Validates image files exist and downloads missing ones.
"""

import re
import time
import logging
from pathlib import Path
from typing import Tuple, Optional

import requests
from PIL import Image
import io

logger = logging.getLogger(__name__)


class ImageValidator:
    """Handles image validation, downloading, and verification"""

    def __init__(self, drawable_dir: str, google_api_key: Optional[str] = None,
                 search_engine_id: Optional[str] = None):
        self.drawable_dir = Path(drawable_dir)
        self.google_api_key = google_api_key
        self.search_engine_id = search_engine_id

    @staticmethod
    def to_drawable_resource_name(site_name: str) -> str:
        """Convert site name to drawable resource name (matches Kotlin logic)"""
        return re.sub(r'[^a-z0-9]', '', site_name.lower())

    def check_image_exists(self, site_name: str) -> Tuple[bool, Optional[Path]]:
        """Check if image file exists for the site"""
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
                    response = requests.get(url, stream=True, timeout=30,
                                          headers={'User-Agent': 'Mozilla/5.0'})
                    if response.status_code == 200:
                        break
                    time.sleep(2 ** attempt)
                except requests.RequestException as e:
                    if attempt == 2:
                        raise
                    time.sleep(2 ** attempt)
            else:
                return False, None, f"HTTP {response.status_code}"

            # Verify it's a valid image
            img = Image.open(io.BytesIO(response.content))
            img.verify()

            # Save image
            with open(output_path, 'wb') as f:
                f.write(response.content)

            return True, output_path, None

        except Exception as e:
            return False, None, str(e)

    def reverse_image_search(self, image_path: Path, expected_site_name: str) -> Tuple[float, str]:
        """
        Perform reverse image search to verify image matches site
        Returns: (confidence_score, details)
        """
        if not self.google_api_key or not self.search_engine_id:
            return 1.0, "SKIP - No API credentials"

        try:
            # Note: This requires Google Custom Search API setup
            # For now, return placeholder
            # TODO: Implement actual reverse image search
            return 1.0, "SKIP - Not implemented yet"
        except Exception as e:
            return 0.0, f"ERROR: {str(e)}"
