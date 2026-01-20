#!/usr/bin/env python3
"""
Complete Database Fix Script

Fixes all database issues:
1. Author field (country extraction)
2. All description translations (9 languages)
3. Style translations (author/country in all languages)
4. Location coordinates (longitude,latitude with commas)
"""

import sqlite3
import logging
import sys
import os
import re
import argparse
from pathlib import Path
from typing import List, Dict, Optional, Tuple
import time

from database_fix.WHS_Extractors import SmartCountryExtractor, CoordinateExtractor

# Add parent directory to path
sys.path.insert(0, str(Path(__file__).parent))

from scrapers.unesco_scraper import UNESCOScraper
from deep_translator import GoogleTranslator

logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s'
)
logger = logging.getLogger(__name__)


class CompleteDatabaseFixer:
    """Fixes all database issues in one pass"""

    # Languages to process
    LANGUAGES = ['fr', 'es', 'de', 'it', 'pt', 'ru', 'ar', 'zh', 'ja', 'ro', 'tr', 'pl', 'hu', 'hi']

    def __init__(self, db_path: str, test_one: bool = False):
        self.db_path = Path(db_path)
        self.conn = None
        self.scraper = UNESCOScraper(use_selenium=True)
        self.country_extractor = SmartCountryExtractor()
        self.coord_extractor = CoordinateExtractor()
        self.test_one = test_one

    def connect(self):
        """Connect to database"""
        logger.info(f"Connecting to {self.db_path}")
        self.conn = sqlite3.connect(self.db_path)
        self.conn.row_factory = sqlite3.Row

    def close(self):
        """Close connections"""
        if self.conn:
            try:
                self.conn.commit()
                logger.info("Committed final changes to database")
            except Exception as e:
                logger.warning(f"Final commit failed: {e}")
            finally:
                self.conn.close()
                logger.info("Database connection closed")

        if self.scraper:
            try:
                self.scraper.close()
                logger.info("Selenium driver closed (scraper)")
            except Exception as e:
                logger.warning(f"Error closing scraper: {e}")

        if self.coord_extractor:
            try:
                self.coord_extractor.close()
                logger.info("Selenium driver closed (coordinates)")
            except Exception as e:
                logger.warning(f"Error closing coordinate extractor: {e}")

    def translate_country(self, country: str, target_lang: str) -> Optional[str]:
        """Translate country name(s) to target language"""
        try:
            # Map language codes for Google Translate API
            lang_map = {
                'zh': 'zh-CN',  # Chinese Simplified
                'ja': 'ja',
                'ar': 'ar',
                'ru': 'ru',
                'pt': 'pt',
                'it': 'it',
                'de': 'de',
                'es': 'es',
                'fr': 'fr',
                'ro': 'ro',
                'tr': 'tr',
                'pl': 'pl',
                'hu': 'hu',
                'hi': 'hi'
            }
            api_lang = lang_map.get(target_lang, target_lang)

            translator = GoogleTranslator(source='en', target=api_lang)
            translated = translator.translate(country)
            time.sleep(0.2)  # Rate limit
            return translated
        except Exception as e:
            logger.warning(f"Translation to {target_lang} failed: {e}")
            return None

    def fix_all_issues(self):
        """Fix author, translations, style translations, and locations in one pass"""
        logger.info("=" * 60)
        logger.info("FIXING ALL DATABASE ISSUES")
        logger.info("=" * 60)

        cursor = self.conn.cursor()

        # Find rows that need fixing - check ALL language columns
        query = """
            SELECT id, paintingname, description, author, location,
                   description_fr, description_es, description_de, description_it, description_pt,
                   description_ru, description_ar, description_zh, description_ja, description_ro,
                   description_tr, description_pl, description_hu, description_hi,
                   paintingname_fr, paintingname_es, paintingname_de, paintingname_it, paintingname_pt,
                   paintingname_ru, paintingname_ar, paintingname_zh, paintingname_ja, paintingname_ro,
                   paintingname_tr, paintingname_pl, paintingname_hu, paintingname_hi,
                   style_fr, style_es, style_de
            FROM museum_item
            WHERE (author = 'UNESCO World Heritage Site' OR author IS NULL OR author = '')
               OR (description_fr IS NULL OR description_fr = '')
               OR (description_es IS NULL OR description_es = '')
               OR (description_de IS NULL OR description_de = '')
               OR (description_it IS NULL OR description_it = '')
               OR (description_pt IS NULL OR description_pt = '')
               OR (description_ru IS NULL OR description_ru = '')
               OR (description_ar IS NULL OR description_ar = '')
               OR (description_zh IS NULL OR description_zh = '')
               OR (description_ja IS NULL OR description_ja = '')
               OR (description_ro IS NULL OR description_ro = '')
               OR (description_tr IS NULL OR description_tr = '')
               OR (description_pl IS NULL OR description_pl = '')
               OR (description_hu IS NULL OR description_hu = '')
               OR (description_hi IS NULL OR description_hi = '')
               OR (paintingname_fr IS NULL OR paintingname_fr = '')
               OR (paintingname_es IS NULL OR paintingname_es = '')
               OR (paintingname_de IS NULL OR paintingname_de = '')
               OR (paintingname_it IS NULL OR paintingname_it = '')
               OR (paintingname_pt IS NULL OR paintingname_pt = '')
               OR (paintingname_ru IS NULL OR paintingname_ru = '')
               OR (paintingname_ar IS NULL OR paintingname_ar = '')
               OR (paintingname_zh IS NULL OR paintingname_zh = '')
               OR (paintingname_ja IS NULL OR paintingname_ja = '')
               OR (paintingname_ro IS NULL OR paintingname_ro = '')
               OR (paintingname_tr IS NULL OR paintingname_tr = '')
               OR (paintingname_pl IS NULL OR paintingname_pl = '')
               OR (paintingname_hu IS NULL OR paintingname_hu = '')
               OR (paintingname_hi IS NULL OR paintingname_hi = '')
               OR (style_fr IS NULL OR style_fr = '')
               OR (location IS NULL OR location = '')
            ORDER BY id
        """

        if self.test_one:
            query += " LIMIT 1"

        cursor.execute(query)
        rows_to_fix = cursor.fetchall()
        total = len(rows_to_fix)

        if self.test_one:
            logger.info(f"TEST MODE: Processing 1 row\n")
        else:
            logger.info(f"Found {total} rows needing fixes\n")

        if total == 0:
            logger.info("Nothing to fix!")
            return

        # Get UNESCO site list once
        logger.info("Fetching UNESCO site list...")
        unesco_sites = self.scraper.scrape_list()

        name_to_id = {}
        if unesco_sites:
            for site in unesco_sites:
                name_lower = site['name'].lower().strip()
                name_to_id[name_lower] = site['id']
            logger.info(f"Loaded {len(name_to_id)} UNESCO sites\n")

        # Process each row
        stats = {
            'author': 0,
            'translations': 0,
            'style_translations': 0,
            'locations': 0
        }

        for i, row in enumerate(rows_to_fix):
            site_id = row['id']
            site_name = row['paintingname']
            current_author = row['author']
            current_location = row['location']
            has_style_translations = row['style_fr'] and row['style_fr'].strip()

            logger.info(f"\n[{i+1}/{total}] {site_name}")

            needs_author = not current_author or current_author == 'UNESCO World Heritage Site'
            needs_style_translations = not has_style_translations
            needs_location = not current_location or current_location.strip() == ''

            # Check which specific language translations are missing
            missing_desc_langs = []
            missing_name_langs = []
            for lang in self.LANGUAGES:
                desc_key = f'description_{lang}'
                name_key = f'paintingname_{lang}'

                try:
                    desc_value = row[desc_key]
                    if not desc_value or not desc_value.strip():
                        missing_desc_langs.append(lang)
                except (KeyError, IndexError):
                    # Column doesn't exist or can't be accessed
                    missing_desc_langs.append(lang)

                try:
                    name_value = row[name_key]
                    if not name_value or not name_value.strip():
                        missing_name_langs.append(lang)
                except (KeyError, IndexError):
                    # Column doesn't exist or can't be accessed
                    missing_name_langs.append(lang)

            needs_translations = len(missing_desc_langs) > 0 or len(missing_name_langs) > 0

            # Find UNESCO ID
            name_lower = site_name.lower().strip()
            unesco_id = name_to_id.get(name_lower)

            if not unesco_id:
                # Fuzzy match
                for unesco_name, uid in name_to_id.items():
                    if name_lower in unesco_name or unesco_name in name_lower:
                        unesco_id = uid
                        break

            if unesco_id:
                logger.info(f"  UNESCO ID: {unesco_id}")

            # STEP 1: Get country for author field
            country = None
            if needs_author:
                pass
                # country = self.country_extractor.get_country(site_name, unesco_id)
                #
                # if country:
                #     logger.info(f"  ✓ Country: {country}")
                #     if site_id is not None:
                #         cursor.execute(
                #             "UPDATE museum_item SET author = ? WHERE id = ?",
                #             (country, site_id)
                #         )
                #     else:
                #         cursor.execute(
                #             "UPDATE museum_item SET author = ? WHERE paintingname = ? AND id IS NULL",
                #             (country, site_name)
                #         )
                #     self.conn.commit()
                #     stats['author'] += 1
                # else:
                #     logger.warning(f"  ✗ Could not find country - PLEASE ADD TO MANUAL_COUNTRY_MAP")

            # Get country from current author if we didn't extract it
            if not country:
                country = current_author

            # If country is still generic or empty, can't do style translations
            if country and country != 'UNESCO World Heritage Site':
                pass  # We have a valid country
            else:
                country = None  # Invalid for translations

            # STEP 2: Get description and name translations
            if needs_translations:
                desc_translations = {}
                name_translations = {}
                english_desc = row['description']
                english_name = row['paintingname']

                # Translate descriptions
                if missing_desc_langs:
                    logger.info(f"  Missing description translations: {', '.join([l.upper() for l in missing_desc_langs])}")
                    if not english_desc or not english_desc.strip():
                        logger.warning(f"  ✗ No English description to translate from")
                    else:
                        for lang in missing_desc_langs:
                            try:
                                # Map language codes for Google Translate
                                lang_map = {
                                    'zh': 'zh-CN',
                                    'ja': 'ja',
                                    'ar': 'ar',
                                    'ru': 'ru',
                                    'pt': 'pt',
                                    'it': 'it',
                                    'de': 'de',
                                    'es': 'es',
                                    'fr': 'fr',
                                    'ro': 'ro',
                                    'tr': 'tr',
                                    'pl': 'pl',
                                    'hu': 'hu',
                                    'hi': 'hi'
                                }
                                api_lang = lang_map.get(lang, lang)

                                translator = GoogleTranslator(source='en', target=api_lang)
                                translated = translator.translate(english_desc[:5000])
                                if translated and translated.strip():
                                    desc_translations[lang] = translated
                                    logger.info(f"    ✓ description_{lang.upper()}: {len(translated)} chars")
                                else:
                                    logger.warning(f"    ✗ description_{lang.upper()}: Empty translation")
                                time.sleep(0.3)  # Rate limit
                            except Exception as e:
                                logger.warning(f"    ✗ description_{lang.upper()} translation failed: {e}")

                # Translate painting names
                if missing_name_langs:
                    logger.info(f"  Missing name translations: {', '.join([l.upper() for l in missing_name_langs])}")
                    if not english_name or not english_name.strip():
                        logger.warning(f"  ✗ No English name to translate from")
                    else:
                        for lang in missing_name_langs:
                            try:
                                # Map language codes for Google Translate
                                lang_map = {
                                    'zh': 'zh-CN',
                                    'ja': 'ja',
                                    'ar': 'ar',
                                    'ru': 'ru',
                                    'pt': 'pt',
                                    'it': 'it',
                                    'de': 'de',
                                    'es': 'es',
                                    'fr': 'fr',
                                    'ro': 'ro',
                                    'tr': 'tr',
                                    'pl': 'pl',
                                    'hu': 'hu',
                                    'hi': 'hi'
                                }
                                api_lang = lang_map.get(lang, lang)

                                translator = GoogleTranslator(source='en', target=api_lang)
                                translated = translator.translate(english_name)
                                if translated and translated.strip():
                                    name_translations[lang] = translated
                                    logger.info(f"    ✓ paintingname_{lang.upper()}: {translated}")
                                else:
                                    logger.warning(f"    ✗ paintingname_{lang.upper()}: Empty translation")
                                time.sleep(0.3)  # Rate limit
                            except Exception as e:
                                logger.warning(f"    ✗ paintingname_{lang.upper()} translation failed: {e}")

                # Update database with all translations
                if desc_translations or name_translations:
                    try:
                        updates = []
                        values = []
                        for lang, text in desc_translations.items():
                            updates.append(f"description_{lang} = ?")
                            values.append(text)
                        for lang, text in name_translations.items():
                            updates.append(f"paintingname_{lang} = ?")
                            values.append(text)

                        if site_id is not None:
                            sql = f"UPDATE museum_item SET {', '.join(updates)} WHERE id = ?"
                            values.append(site_id)
                        else:
                            sql = f"UPDATE museum_item SET {', '.join(updates)} WHERE paintingname = ? AND id IS NULL"
                            values.append(site_name)

                        logger.info(f"  Writing {len(desc_translations)} desc + {len(name_translations)} name translations to DB")
                        cursor.execute(sql, values)
                        self.conn.commit()
                        stats['translations'] += 1
                    except Exception as db_error:
                        logger.error(f"  ✗ Failed to write translations to DB: {db_error}")
                else:
                    logger.debug(f"  No translations to write")

            # STEP 3: Translate style (country) field
            if needs_style_translations and country:
                try:
                    logger.info(f"  Translating style (country) field...")
                    style_translations = {}

                    for lang in self.LANGUAGES:
                        try:
                            translated = self.translate_country(country, lang)
                            if translated:
                                style_translations[lang] = translated
                                logger.info(f"    ✓ style_{lang}: {translated}")
                        except Exception as trans_error:
                            logger.warning(f"    ✗ style_{lang} translation failed: {trans_error}")

                    if style_translations:
                        try:
                            updates = []
                            values = []
                            for lang, text in style_translations.items():
                                updates.append(f"style_{lang} = ?")
                                values.append(text)

                            if site_id is not None:
                                sql = f"UPDATE museum_item SET {', '.join(updates)} WHERE id = ?"
                                values.append(site_id)
                            else:
                                sql = f"UPDATE museum_item SET {', '.join(updates)} WHERE paintingname = ? AND id IS NULL"
                                values.append(site_name)

                            logger.info(f"  Writing {len(style_translations)} style translations to DB")
                            cursor.execute(sql, values)
                            self.conn.commit()
                            stats['style_translations'] += 1
                        except Exception as db_error:
                            logger.error(f"  ✗ Failed to write style translations to DB: {db_error}")
                    else:
                        logger.debug(f"  No style translations generated")
                except Exception as style_error:
                    logger.error(f"  ✗ Style translation process failed: {style_error}")

            # STEP 4: Extract coordinates
            if needs_location and unesco_id:
                try:
                    logger.info(f"  Extracting coordinates...")
                    location = self.coord_extractor.extract_coordinates(unesco_id)

                    if location:
                        logger.info(f"    ✓ Location: {location}")
                        try:
                            if site_id is not None:
                                cursor.execute(
                                    "UPDATE museum_item SET location = ? WHERE id = ?",
                                    (location, site_id)
                                )
                            else:
                                cursor.execute(
                                    "UPDATE museum_item SET location = ? WHERE paintingname = ? AND id IS NULL",
                                    (location, site_name)
                                )
                            self.conn.commit()
                            stats['locations'] += 1
                        except Exception as db_error:
                            logger.error(f"    ✗ Failed to write location to DB: {db_error}")
                    else:
                        logger.warning(f"    ✗ Could not extract coordinates")
                except Exception as coord_error:
                    logger.error(f"  ✗ Coordinate extraction failed: {coord_error}")

            if self.test_one:
                logger.info("\n" + "=" * 60)
                logger.info("TEST COMPLETE")
                logger.info("=" * 60)
                logger.info(f"Author fixed: {stats['author'] > 0}")
                logger.info(f"Translations added: {stats['translations'] > 0}")
                logger.info(f"Style translations added: {stats['style_translations'] > 0}")
                logger.info(f"Locations added: {stats['locations'] > 0}")
                return

        logger.info("\n" + "=" * 60)
        logger.info("SUMMARY")
        logger.info("=" * 60)
        logger.info(f"Total processed: {total}")
        logger.info(f"Author fields fixed: {stats['author']}")
        logger.info(f"Rows with translations added: {stats['translations']}")
        logger.info(f"Rows with style translations added: {stats['style_translations']}")
        logger.info(f"Locations added: {stats['locations']}")

    def run(self):
        """Run all fixes"""
        try:
            self.connect()
            self.fix_all_issues()

            logger.info("\n✅ ALL FIXES COMPLETE")

        except Exception as e:
            logger.error(f"Fix failed: {e}", exc_info=True)
            raise
        finally:
            self.close()


def main():
    parser = argparse.ArgumentParser(description='Complete database fix script')
    parser.add_argument('--test-one', action='store_true',
                       help='Test mode: only process first row')
    parser.add_argument('--db', type=str,
                       default='androidApp/src/main/assets/heritage_sites.db',
                       help='Database path')

    args = parser.parse_args()

    fixer = CompleteDatabaseFixer(args.db, test_one=args.test_one)
    fixer.run()


if __name__ == '__main__':
    main()
