"""
Main Database Validator

Orchestrates the validation and repair process.
"""

import sqlite3
import logging
from pathlib import Path
from typing import List, Dict, Optional

from scrapers.unesco_scraper import UNESCOScraper
from validators.language_checker import LanguageChecker
from validators.image_validator import ImageValidator
from utils.report_generator import ReportGenerator

logger = logging.getLogger(__name__)


class DatabaseValidator:
    """Main orchestrator for database validation"""

    def __init__(self, db_path: str, drawable_dir: str, output_dir: str,
                 google_api_key: Optional[str] = None, search_engine_id: Optional[str] = None,
                 skip_images: bool = False, skip_unesco_sync: bool = False,
                 apply_fixes: bool = True, max_new_sites: int = 0):
        self.db_path = Path(db_path)
        self.drawable_dir = Path(drawable_dir)
        self.apply_fixes = apply_fixes
        self.skip_images = skip_images
        self.skip_unesco_sync = skip_unesco_sync
        self.max_new_sites = max_new_sites  # 0 = no limit

        self.lang_checker = LanguageChecker()
        self.image_validator = ImageValidator(drawable_dir, google_api_key, search_engine_id)
        self.unesco_scraper = UNESCOScraper(use_selenium=True)
        self.report_gen = ReportGenerator(output_dir)

        self.conn = None
        self.fixes = []

    def connect_db(self):
        """Connect to database"""
        logger.info(f"Connecting to database: {self.db_path}")
        self.conn = sqlite3.connect(self.db_path)
        self.conn.row_factory = sqlite3.Row

    def load_entries(self) -> List[Dict]:
        """Load all entries from database"""
        logger.info("Loading database entries...")

        cursor = self.conn.cursor()
        cursor.execute("""
            SELECT id, paintingname, author, description,
                   description_ro, description_it, description_es,
                   description_de, description_fr, description_pt,
                   description_ru, description_ar, description_zh,
                   description_ja, full_image_uri, location, style
            FROM museum_item
            ORDER BY id
        """)

        entries = []
        for row in cursor.fetchall():
            entries.append(dict(row))

        logger.info(f"Loaded {len(entries)} entries")
        return entries

    def validate_languages(self, entries: List[Dict]):
        """Validate all language fields"""
        logger.info("Validating language fields...")

        for i, entry in enumerate(entries):
            if (i + 1) % 100 == 0:
                logger.info(f"  Processed {i + 1}/{len(entries)} entries...")

            # Check for language mix-ups
            mixup = self.lang_checker.detect_language_mixup(entry)
            if mixup:
                logger.warning(f"  Language issue in [{entry['id']}] {entry['paintingname']}: {mixup['issue']}")

                # Handle the mixup
                if mixup['issue'] == 'language_swap':
                    # Simple swap
                    mixup['new_en'] = mixup['current_ro']
                    mixup['new_ro'] = mixup['current_en']
                    mixup['status'] = 'FIXED'

                    self.fixes.append({
                        'type': 'language_swap',
                        'id': entry['id'],
                        'name': entry['paintingname'],
                        'new_en': mixup['new_en'],
                        'new_ro': mixup['new_ro']
                    })

                    self.report_gen.stats['language_fixed'] += 1

                elif mixup['issue'] == 'ro_in_en_field':
                    # Move Romanian to correct field
                    mixup['new_ro'] = mixup['current_en']
                    mixup['new_en'] = ''
                    mixup['status'] = 'NEEDS_MANUAL_FIX'

                    self.fixes.append({
                        'type': 'update_description',
                        'id': entry['id'],
                        'name': entry['paintingname'],
                        'field': 'description_ro',
                        'value': mixup['new_ro']
                    })

                self.report_gen.add_language_issue(mixup)

            # Check for missing translations in other languages
            missing_langs = []
            for lang in ['it', 'es', 'de', 'fr', 'pt', 'ru', 'ar', 'zh', 'ja']:
                field = f'description_{lang}'
                if not entry.get(field):
                    missing_langs.append(lang)

            # If ALL descriptions are missing and we have English, translate
            all_missing = all(not entry.get(f'description_{lang}')
                            for lang in ['it', 'es', 'de', 'fr', 'pt', 'ru', 'ar', 'zh', 'ja'])

            if all_missing and entry.get('description'):
                # Only translate to Romanian if missing (others can come from UNESCO)
                if not entry.get('description_ro'):
                    translated = self.lang_checker.translate_text(entry['description'], 'ro', 'en')
                    if translated:
                        self.fixes.append({
                            'type': 'update_description',
                            'id': entry['id'],
                            'name': entry['paintingname'],
                            'field': 'description_ro',
                            'value': translated
                        })

        logger.info(f"Language validation complete. Found {self.report_gen.stats['language_issues']} issues")

    def validate_authors(self, entries: List[Dict]):
        """Validate author fields"""
        logger.info("Validating author fields...")

        for entry in entries:
            if not entry.get('author') or entry['author'].strip() == '':
                self.report_gen.add_author_issue({
                    'id': entry['id'],
                    'name': entry['paintingname'],
                    'status': 'NEEDS_MANUAL_FIX'
                })

                # Set default author
                self.fixes.append({
                    'type': 'update_author',
                    'id': entry['id'],
                    'name': entry['paintingname'],
                    'author': 'UNESCO World Heritage Site'
                })
                self.report_gen.stats['authors_fixed'] += 1

        logger.info(f"Author validation complete. Found {self.report_gen.stats['missing_authors']} missing authors")

    def validate_images(self, entries: List[Dict]):
        """Validate image files"""
        if self.skip_images:
            logger.info("Skipping image validation (--skip-images flag)")
            return

        logger.info("Validating images...")

        for i, entry in enumerate(entries):
            if (i + 1) % 100 == 0:
                logger.info(f"  Processed {i + 1}/{len(entries)} images...")

            site_name = entry['paintingname']
            exists, image_path = self.image_validator.check_image_exists(site_name)

            if not exists:
                # Image missing - try to download
                full_image_uri = entry.get('full_image_uri', '')
                if full_image_uri:
                    # Take first URL
                    first_url = full_image_uri.split(',')[0].strip()

                    logger.info(f"  Downloading image for [{entry['id']}] {site_name} from {first_url}")
                    success, path, error = self.image_validator.download_image(first_url, site_name)

                    if success:
                        self.report_gen.add_image_issue({
                            'id': entry['id'],
                            'name': site_name,
                            'type': 'missing',
                            'details': f'Downloaded from {first_url}',
                            'status': 'FIXED'
                        })
                        self.report_gen.stats['images_downloaded'] += 1
                    else:
                        self.report_gen.add_image_issue({
                            'id': entry['id'],
                            'name': site_name,
                            'type': 'missing',
                            'details': f'Download failed: {error}',
                            'status': 'FAILED'
                        })
                        logger.error(f"  Downloading image failed at {first_url}")
                else:
                    self.report_gen.add_image_issue({
                        'id': entry['id'],
                        'name': site_name,
                        'type': 'missing',
                        'details': 'No full_image_uri available',
                        'status': 'NEEDS_MANUAL_FIX'
                    })

        logger.info(f"Image validation complete. Missing: {self.report_gen.stats['missing_images']}, "
                   f"Downloaded: {self.report_gen.stats['images_downloaded']}")

    def sync_with_unesco(self, existing_entries: List[Dict]):
        """Sync with UNESCO's official list"""
        if self.skip_unesco_sync:
            logger.info("Skipping UNESCO sync (--skip-unesco-sync flag)")
            return

        logger.info("Syncing with UNESCO list...")

        # Get UNESCO list
        unesco_sites = self.unesco_scraper.scrape_list()

        if not unesco_sites:
            logger.warning("Failed to fetch UNESCO list, skipping sync")
            return

        # Build set of existing site names (normalized)
        existing_names = set()
        for entry in existing_entries:
            name = entry['paintingname'].lower().strip()
            existing_names.add(name)

        # Find missing sites
        missing_sites = []
        for site in unesco_sites:
            name = site['name'].lower().strip()
            if name not in existing_names:
                missing_sites.append(site)

        logger.info(f"Found {len(missing_sites)} missing UNESCO sites")

        # Determine how many to add
        sites_to_add = missing_sites
        if self.max_new_sites > 0:
            sites_to_add = missing_sites[:self.max_new_sites]
            logger.info(f"  Limiting to {self.max_new_sites} new sites (use --max-new-sites 0 for no limit)")
        else:
            logger.info(f"  Adding ALL {len(missing_sites)} missing sites")

        # Add missing sites
        for i, site in enumerate(sites_to_add):
            if (i + 1) % 10 == 0:
                logger.info(f"  Processing {i + 1}/{len(sites_to_add)} new sites...")

            # Get detailed info
            details = self.unesco_scraper.scrape_site_details(site['id'], site['name'])

            # Translate EN description to Romanian if we have English
            desc_ro = details.get('description_ro', '')
            if not desc_ro and details.get('description_en'):
                desc_ro = self.lang_checker.translate_text(details['description_en'], 'ro', 'en')

            # Download image
            image_uri = ''
            if details.get('images'):
                image_uri = ', '.join(details['images'])
                # Download first image
                if not self.skip_images:
                    success, path, error = self.image_validator.download_image(
                        details['images'][0], site['name']
                    )
                    if success:
                        self.report_gen.stats['images_downloaded'] += 1

            # Add to fixes
            self.fixes.append({
                'type': 'insert_site',
                'name': site['name'],
                'description_en': details.get('description_en', site.get('short_description', '')),
                'description_ro': desc_ro or '',
                'description_fr': details.get('description_fr', ''),
                'description_es': details.get('description_es', ''),
                'description_ru': details.get('description_ru', ''),
                'description_zh': details.get('description_zh', ''),
                'description_ja': details.get('description_ja', ''),
                'description_pt': details.get('description_pt', ''),
                'description_de': details.get('description_de', ''),
                'description_it': details.get('description_it', ''),
                'description_ar': details.get('description_ar', ''),
                'author': 'UNESCO World Heritage Site',
                'location': site.get('location', ''),
                'image_uri': image_uri,
                'style': site.get('category', 'World Heritage')
            })

            self.report_gen.add_new_site(site)
            self.report_gen.stats['sites_added'] += 1

        logger.info(f"UNESCO sync complete. Added {self.report_gen.stats['sites_added']} new sites")

    def run(self):
        """Run the validation process"""
        logger.info("=" * 60)
        logger.info("UNESCO HERITAGE DATABASE VALIDATOR")
        logger.info("=" * 60)

        try:
            # Connect to database
            self.connect_db()

            # Load entries
            entries = self.load_entries()

            # Run validations
            self.validate_languages(entries)
            self.validate_authors(entries)
            self.validate_images(entries)
            self.sync_with_unesco(entries)

            # Generate outputs
            logger.info("\nGenerating reports...")
            sql_path = self.report_gen.generate_sql_fixes(self.fixes)
            report_path = self.report_gen.generate_report()
            stats_path = self.report_gen.generate_statistics_json()

            logger.info(f"✓ SQL fixes: {sql_path}")
            logger.info(f"✓ Report: {report_path}")
            logger.info(f"✓ Statistics: {stats_path}")

            # Apply fixes if requested
            if self.apply_fixes:
                logger.warning("Applying fixes to database...")
                # TODO: Implement apply_fixes
                logger.warning("Auto-apply not implemented yet. Please review and apply SQL manually.")

            logger.info("\n" + "=" * 60)
            logger.info("VALIDATION COMPLETE")
            logger.info("=" * 60)
            total_issues = (self.report_gen.stats['language_issues'] +
                           self.report_gen.stats['missing_authors'] +
                           self.report_gen.stats['missing_images'])
            logger.info(f"Issues found: {total_issues}")
            logger.info(f"Fixes generated: {len(self.fixes)}")
            logger.info("\nPlease review the reports before applying fixes!")

        except Exception as e:
            logger.error(f"Validation failed: {e}", exc_info=True)
            raise
        finally:
            if self.conn:
                self.conn.close()
            # Close Selenium driver
            self.unesco_scraper.close()
