#!/usr/bin/env python3
"""
Add Missing Countries to Authors Table

Scrapes Wikipedia for information about missing countries and adds them to the authors table.
"""

import sqlite3
import logging
import time
import re
import argparse
from pathlib import Path
from typing import Dict, List, Optional, Tuple
import requests
from bs4 import BeautifulSoup
from deep_translator import GoogleTranslator

logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s'
)
logger = logging.getLogger(__name__)


class WikipediaCountryScraper:
    """Scrapes Wikipedia for country information"""

    # Supported languages matching the authors table
    LANGUAGES = ['ro', 'es', 'de', 'fr', 'it', 'ru', 'pt', 'ar', 'zh', 'ja', 'tr', 'hi', 'hu', 'pl']

    def __init__(self):
        self.session = requests.Session()
        self.session.headers.update({
            'User-Agent': 'MuseumApp/1.0 (educational project; museum-heritage-app)'
        })

    def normalize_country_name(self, country: str) -> str:
        """Normalize country name for Wikipedia search"""
        # Handle special cases
        normalizations = {
            'Venezuela (Bolivarian Republic of)': 'Venezuela',
            "Cote d'Ivoire": 'Ivory Coast',
            "Côte d'Ivoire": 'Ivory Coast',
            'Gambia': 'The Gambia',
            "Lao People's Democratic Republic": 'Laos',
            "Democratic People's Republic of Korea": 'North Korea',
            'Congo': 'Republic of the Congo',
            'Republic of the Congo': 'Republic of the Congo',
            'the Former Yugoslav Republic of Macedonia': 'North Macedonia',
            'Iran': 'Iran',
            'San Salvador': 'El Salvador',  # Likely a mistake
            'Bolivia': 'Bolivia',
            'Lesotho': 'Lesotho',
            'Cabo Verde': 'Cape Verde',
            'Eritrea': 'Eritrea',
            'United Kingdom': 'United Kingdom',
            'Zambia': 'Zambia',
            'Angola': 'Angola',
            'Guinea': 'Guinea',
            'Republic of Moldova': 'Moldova',
            'Jerusalem (Site proposed by Jordan)': None  # Skip this one
        }

        return normalizations.get(country, country)

    def search_wikipedia(self, country: str) -> Optional[str]:
        """Find Wikipedia article URL for country"""
        normalized = self.normalize_country_name(country)

        if normalized is None:
            logger.warning(f"  Skipping '{country}' - not a country")
            return None

        # Try direct Wikipedia URL
        wiki_url = f"https://en.wikipedia.org/wiki/{normalized.replace(' ', '_')}"

        try:
            response = self.session.get(wiki_url, timeout=10)
            if response.status_code == 200:
                # Check if it's a country page (not disambiguation)
                soup = BeautifulSoup(response.content, 'html.parser')

                # Look for infobox that indicates it's a country
                infobox = soup.find('table', class_='infobox')
                if infobox:
                    return wiki_url

            # Try search
            search_url = f"https://en.wikipedia.org/w/api.php"
            params = {
                'action': 'query',
                'list': 'search',
                'srsearch': normalized,
                'format': 'json',
                'utf8': 1
            }

            response = self.session.get(search_url, params=params, timeout=10)
            data = response.json()

            if data.get('query', {}).get('search'):
                first_result = data['query']['search'][0]
                title = first_result['title']
                return f"https://en.wikipedia.org/wiki/{title.replace(' ', '_')}"

        except Exception as e:
            logger.warning(f"  Search failed for '{country}': {e}")

        return None

    def extract_country_info(self, wiki_url: str, country_name: str) -> Optional[Dict]:
        """Extract country information from Wikipedia using the API"""
        try:
            # Extract page title from URL
            page_title = wiki_url.split('/wiki/')[-1]

            # Use Wikipedia API to get extract
            api_url = "https://en.wikipedia.org/w/api.php"
            params = {
                'action': 'query',
                'format': 'json',
                'prop': 'extracts',
                'titles': page_title,
                'explaintext': True,
                'exintro': False,  # Get full text, not just intro
                'exsectionformat': 'plain'
            }

            response = self.session.get(api_url, params=params, timeout=15)
            data = response.json()

            # Extract the page content
            pages = data.get('query', {}).get('pages', {})
            if not pages:
                return None

            # Get the first (and should be only) page
            page_data = list(pages.values())[0]
            extract = page_data.get('extract', '')

            if not extract or len(extract) < 200:
                logger.warning(f"  Could not extract description from Wikipedia API")
                return None

            # Take first ~2000 characters
            description_en = extract[:2000]

            # Try to end at a sentence
            last_period = description_en.rfind('.')
            if last_period > 1000:
                description_en = description_en[:last_period + 1]

            # Clean up citation markers
            description_en = re.sub(r'\[\d+\]', '', description_en)

            info = {
                'name': country_name,
                'description': description_en,
                'link': wiki_url,
                'style': 'Country',  # Mark as country
                'birth': None,
                'death': None,
                'artist_img_link': None
            }

            logger.info(f"  ✓ Extracted {len(description_en)} chars from Wikipedia API")
            return info

        except Exception as e:
            logger.error(f"  Failed to extract info from {wiki_url}: {e}")
            return None

    def translate_description(self, text: str, target_lang: str) -> Optional[str]:
        """Translate text to target language"""
        try:
            # Map language codes
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
            api_lang = lang_map.get(target_lang, target_lang)

            # Limit text length for translation
            text_to_translate = text[:5000] if len(text) > 5000 else text

            translator = GoogleTranslator(source='en', target=api_lang)
            translated = translator.translate(text_to_translate)

            time.sleep(0.3)  # Rate limiting
            return translated

        except Exception as e:
            logger.warning(f"    Translation to {target_lang} failed: {e}")
            return None

    def translate_country_name(self, country_name: str, target_lang: str) -> Optional[str]:
        """Translate country name to target language"""
        try:
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
            api_lang = lang_map.get(target_lang, target_lang)

            translator = GoogleTranslator(source='en', target=api_lang)
            translated = translator.translate(country_name)

            time.sleep(0.2)  # Rate limiting
            return translated

        except Exception as e:
            logger.warning(f"    Name translation to {target_lang} failed: {e}")
            return None

    def get_wikipedia_link_for_language(self, country_name: str, lang_code: str) -> Optional[str]:
        """Get Wikipedia link for a specific language"""
        try:
            normalized = self.normalize_country_name(country_name)
            if normalized is None:
                return None

            # Try direct language Wikipedia
            wiki_url = f"https://{lang_code}.wikipedia.org/wiki/{normalized.replace(' ', '_')}"

            response = self.session.get(wiki_url, timeout=5)
            if response.status_code == 200:
                return wiki_url

        except Exception as e:
            pass

        return None


class CountryDatabaseUpdater:
    """Updates authors table with missing countries"""

    def __init__(self, db_path: str, dry_run: bool = False):
        self.db_path = Path(db_path)
        self.conn = None
        self.scraper = WikipediaCountryScraper()
        self.dry_run = dry_run

    def connect(self):
        """Connect to database"""
        logger.info(f"Connecting to {self.db_path}")
        self.conn = sqlite3.connect(self.db_path)
        self.conn.row_factory = sqlite3.Row

    def close(self):
        """Close database connection"""
        if self.conn:
            if not self.dry_run:
                self.conn.commit()
                logger.info("Committed changes to database")
            self.conn.close()
            logger.info("Database connection closed")

    def get_missing_countries(self) -> List[Tuple[str, int]]:
        """Get list of missing countries from museum_item"""
        logger.info("Finding missing countries...")

        cursor = self.conn.cursor()

        # Get all countries from museum_item
        cursor.execute("""
            SELECT author FROM museum_item
            WHERE author IS NOT NULL AND author != ''
        """)

        museum_countries = {}
        for row in cursor.fetchall():
            countries = [c.strip() for c in row['author'].split(',') if c.strip()]
            for country in countries:
                museum_countries[country] = museum_countries.get(country, 0) + 1

        # Get all countries from authors table
        cursor.execute("SELECT name FROM authors WHERE name IS NOT NULL AND name != ''")
        author_countries = set(row['name'] for row in cursor.fetchall())

        # Find missing
        missing = []
        for country, count in museum_countries.items():
            if country not in author_countries:
                missing.append((country, count))

        # Sort by frequency
        missing.sort(key=lambda x: x[1], reverse=True)

        logger.info(f"Found {len(missing)} missing countries")
        return missing

    def add_country_to_authors(self, country_info: Dict) -> bool:
        """Add country to authors table"""
        try:
            cursor = self.conn.cursor()

            # Build the INSERT query dynamically
            columns = ['name', 'description', 'link', 'style', 'birth', 'death', 'artist_img_link']
            values = [
                country_info['name'],
                country_info['description'],
                country_info['link'],
                country_info['style'],
                country_info.get('birth'),
                country_info.get('death'),
                country_info.get('artist_img_link')
            ]

            # Add translations
            # Note: Some link columns don't exist in the database (pl, hu)
            # These languages are present in the database but only have description/name columns
            for lang in WikipediaCountryScraper.LANGUAGES:
                desc_key = f'description_{lang}'
                name_key = f'name_{lang}'
                link_key = f'link_{lang}'

                if desc_key in country_info:
                    columns.append(desc_key)
                    values.append(country_info[desc_key])

                if name_key in country_info:
                    columns.append(name_key)
                    values.append(country_info[name_key])

                # Skip link columns that don't exist in the database
                if link_key in country_info and lang not in ['pl', 'hu']:
                    columns.append(link_key)
                    values.append(country_info[link_key])

            placeholders = ','.join(['?' for _ in columns])
            sql = f"INSERT INTO authors ({','.join(columns)}) VALUES ({placeholders})"

            if self.dry_run:
                logger.info(f"  [DRY RUN] Would execute: {sql[:100]}...")
                logger.info(f"  [DRY RUN] With values: name={country_info['name']}, desc_len={len(country_info['description'])}")
                return True
            else:
                cursor.execute(sql, values)
                self.conn.commit()
                logger.info(f"  ✓ Inserted into authors table (ID: {cursor.lastrowid})")
                return True

        except Exception as e:
            logger.error(f"  ✗ Failed to insert into database: {e}")
            return False

    def process_missing_countries(self):
        """Main processing logic"""
        logger.info("=" * 60)
        logger.info("ADDING MISSING COUNTRIES TO AUTHORS TABLE")
        if self.dry_run:
            logger.info("[DRY RUN MODE - No changes will be made]")
        logger.info("=" * 60)

        missing_countries = self.get_missing_countries()

        if not missing_countries:
            logger.info("No missing countries to process!")
            return

        logger.info(f"\nProcessing {len(missing_countries)} missing countries:\n")

        stats = {
            'success': 0,
            'failed': 0,
            'skipped': 0
        }

        for i, (country, count) in enumerate(missing_countries, 1):
            logger.info(f"[{i}/{len(missing_countries)}] {country} (used {count} times)")

            # Search Wikipedia
            wiki_url = self.scraper.search_wikipedia(country)
            if not wiki_url:
                logger.warning(f"  ✗ Could not find Wikipedia page")
                stats['failed'] += 1
                continue

            logger.info(f"  Found Wikipedia: {wiki_url}")

            # Extract info
            country_info = self.scraper.extract_country_info(wiki_url, country)
            if not country_info:
                logger.warning(f"  ✗ Could not extract country information")
                stats['failed'] += 1
                continue

            # Translate description to all languages
            logger.info(f"  Translating description to {len(WikipediaCountryScraper.LANGUAGES)} languages...")
            for lang in WikipediaCountryScraper.LANGUAGES:
                translated_desc = self.scraper.translate_description(country_info['description'], lang)
                if translated_desc:
                    country_info[f'description_{lang}'] = translated_desc
                    logger.info(f"    ✓ description_{lang}: {len(translated_desc)} chars")

            # Translate country name to all languages
            logger.info(f"  Translating country name...")
            for lang in WikipediaCountryScraper.LANGUAGES:
                translated_name = self.scraper.translate_country_name(country, lang)
                if translated_name:
                    country_info[f'name_{lang}'] = translated_name
                    logger.info(f"    ✓ name_{lang}: {translated_name}")

            # Get Wikipedia links for each language
            logger.info(f"  Finding Wikipedia links for other languages...")
            for lang in WikipediaCountryScraper.LANGUAGES:
                wiki_link = self.scraper.get_wikipedia_link_for_language(country, lang)
                if wiki_link:
                    country_info[f'link_{lang}'] = wiki_link

            # Add to database
            if self.add_country_to_authors(country_info):
                stats['success'] += 1
            else:
                stats['failed'] += 1

            # Rate limiting
            time.sleep(1)

        # Summary
        logger.info("\n" + "=" * 60)
        logger.info("SUMMARY")
        logger.info("=" * 60)
        logger.info(f"Total processed: {len(missing_countries)}")
        logger.info(f"Successfully added: {stats['success']}")
        logger.info(f"Failed: {stats['failed']}")
        logger.info(f"Skipped: {stats['skipped']}")

    def run(self):
        """Run the updater"""
        try:
            self.connect()
            self.process_missing_countries()

            logger.info("\n✅ COMPLETE")

        except Exception as e:
            logger.error(f"Update failed: {e}", exc_info=True)
            raise
        finally:
            self.close()


def main():
    parser = argparse.ArgumentParser(
        description='Add missing countries to authors table from Wikipedia'
    )
    parser.add_argument('--db', type=str,
                       default='androidApp/src/main/assets/heritage_sites.db',
                       help='Database path')
    parser.add_argument('--dry-run', action='store_true',
                       help='Dry run - do not modify database')
    parser.add_argument('--country', type=str,
                       help='Process only this specific country (for testing)')

    args = parser.parse_args()

    updater = CountryDatabaseUpdater(args.db, dry_run=args.dry_run)
    updater.run()


if __name__ == '__main__':
    main()
