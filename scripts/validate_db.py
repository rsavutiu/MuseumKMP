#!/usr/bin/env python3
"""
UNESCO Heritage Sites Database Validator - Main Entry Point

Usage:
    python validate_db.py [options]

Example:
    python validate_db.py --max-new-sites 100
    python validate_db.py --skip-images
    python validate_db.py --max-new-sites 0  # No limit, add all
"""

import argparse
import logging
import sys
from pathlib import Path

from database_validator import DatabaseValidator

# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s',
    datefmt='%Y-%m-%d %H:%M:%S'
)
logger = logging.getLogger(__name__)


def main():
    """Main entry point"""
    parser = argparse.ArgumentParser(
        description='UNESCO Heritage Sites Database Validator and Repair Tool',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  # Validate and add up to 100 new sites
  python validate_db.py --max-new-sites 100

  # Add ALL missing UNESCO sites (no limit)
  python validate_db.py --max-new-sites 0

  # Skip image validation
  python validate_db.py --skip-images

  # Full validation with all sites
  python validate_db.py --max-new-sites 0 --verbose
        """
    )

    parser.add_argument('--db', type=str,
                       default='../androidApp/src/main/assets/heritage_sites.db',
                       help='Path to heritage_sites.db')
    parser.add_argument('--drawable', type=str,
                       default='../androidApp/src/main/res/drawable-nodpi',
                       help='Path to drawable-nodpi folder')
    parser.add_argument('--google-api-key', type=str,
                       help='Google API key for reverse image search')
    parser.add_argument('--search-engine-id', type=str,
                       help='Google Custom Search Engine ID')
    parser.add_argument('--apply-fixes', action='store_true',
                       help='Apply fixes automatically (use with caution)')
    parser.add_argument('--skip-images', action='store_true',
                       help='Skip image validation')
    parser.add_argument('--skip-unesco-sync', action='store_true',
                       help='Skip UNESCO list comparison')
    parser.add_argument('--max-new-sites', type=int, default=50,
                       help='Maximum new sites to add (0 = no limit, default = 50)')
    parser.add_argument('--verbose', action='store_true',
                       help='Enable verbose logging')
    parser.add_argument('--output-dir', type=str,
                       default='./validation_output',
                       help='Output directory for reports')

    args = parser.parse_args()

    # Set log level
    if args.verbose:
        logging.getLogger().setLevel(logging.DEBUG)

    # Resolve paths relative to script location
    script_dir = Path(__file__).parent
    db_path = script_dir / args.db
    drawable_path = script_dir / args.drawable

    logger.info(f"Database: {db_path}")
    logger.info(f"Drawable: {drawable_path}")
    logger.info(f"Max new sites: {'UNLIMITED' if args.max_new_sites == 0 else args.max_new_sites}")

    # Create validator and run
    validator = DatabaseValidator(
        db_path=str(db_path),
        drawable_dir=str(drawable_path),
        output_dir=args.output_dir,
        google_api_key=args.google_api_key,
        search_engine_id=args.search_engine_id,
        skip_images=args.skip_images,
        skip_unesco_sync=args.skip_unesco_sync,
        apply_fixes=args.apply_fixes,
        max_new_sites=args.max_new_sites
    )

    try:
        validator.run()
        return 0
    except Exception as e:
        logger.error(f"Validation failed: {e}")
        return 1


if __name__ == '__main__':
    sys.exit(main())
