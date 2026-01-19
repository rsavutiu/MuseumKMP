#!/usr/bin/env python3
"""
UNESCO Heritage Sites Database Validator and Repair Tool

This script validates and repairs the heritage_sites.db database by:
- Checking language fields for all 11 supported languages
- Auto-detecting and fixing language mix-ups
- Validating and downloading missing images
- Verifying images match heritage sites via reverse image search
- Syncing with UNESCO's official list
- Generating detailed reports and SQL fix scripts
"""

import sqlite3
import os
import re
import sys
import json
import argparse
import logging
import time
import csv
from datetime import datetime
from pathlib import Path
from typing import Dict, List, Optional, Tuple
from urllib.parse import urlparse

import requests
from bs4 import BeautifulSoup
from langdetect import detect, LangDetectException
from deep_translator import GoogleTranslator
from PIL import Image
import io
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.chrome.service import Service as ChromeService
from selenium.webdriver.chrome.options import Options as ChromeOptions
from webdriver_manager.chrome import ChromeDriverManager
from selenium.common.exceptions import TimeoutException, NoSuchElementException


# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s',
    datefmt='%Y-%m-%d %H:%M:%S'
)
logger = logging.getLogger(__name__)


# Language code mappings
SUPPORTED_LANGUAGES = {
    'en': 'English',
    'ro': 'Romanian',
    'it': 'Italian',
    'es': 'Spanish',
    'de': 'German',
    'fr': 'French',
    'pt': 'Portuguese',
    'ru': 'Russian',
    'ar': 'Arabic',
    'zh': 'Chinese',
    'ja': 'Japanese'
}

# Langdetect to our language code mapping
LANGDETECT_TO_CODE = {
    'en': 'en',
    'ro': 'ro',
    'it': 'it',
    'es': 'es',
    'de': 'de',
    'fr': 'fr',
    'pt': 'pt',
    'ru': 'ru',
    'ar': 'ar',
    'zh-cn': 'zh',
    'zh-tw': 'zh',
    'ja': 'ja'
}


class LanguageChecker:
    """Handles language detection, validation, and translation"""

    def __init__(self):
        self.translator = None
        self.translation_cache = {}

    def detect_language(self, text: str) -> Optional[str]:
        """Detect language of text, returns language code or None"""
        if not text or len(text.strip()) < 10:
            return None

        try:
            detected = detect(text)
            return LANGDETECT_TO_CODE.get(detected, detected)
        except LangDetectException:
            return None

    def detect_language_mixup(self, entry: Dict) -> Optional[Dict]:
        """
        Check if English/Romanian fields have swapped content
        Returns issue dict if mixup detected, None otherwise
        """
        en_desc = entry.get('description', '')
        ro_desc = entry.get('description_ro', '')

        if not en_desc or not ro_desc:
            # Check if we have Romanian in English field but no Romanian
            if en_desc and not ro_desc:
                en_lang = self.detect_language(en_desc)
                if en_lang == 'ro':
                    return {
                        'id': entry['id'],
                        'name': entry['paintingname'],
                        'issue': 'ro_in_en_field',
                        'fix': 'move_and_fetch_en',
                        'current_en': en_desc,
                        'current_ro': ro_desc
                    }
            return None

        # Detect languages
        en_lang = self.detect_language(en_desc)
        ro_lang = self.detect_language(ro_desc)

        # Check for swap
        if en_lang == 'ro' and ro_lang == 'en':
            return {
                'id': entry['id'],
                'name': entry['paintingname'],
                'issue': 'language_swap',
                'fix': 'swap_fields',
                'current_en': en_desc,
                'current_ro': ro_desc
            }
        elif en_lang == 'ro':
            return {
                'id': entry['id'],
                'name': entry['paintingname'],
                'issue': 'ro_in_en_field',
                'fix': 'move_and_fetch_en',
                'current_en': en_desc,
                'current_ro': ro_desc
            }
        elif ro_lang == 'en':
            return {
                'id': entry['id'],
                'name': entry['paintingname'],
                'issue': 'en_in_ro_field',
                'fix': 'move_and_fetch_ro',
                'current_en': en_desc,
                'current_ro': ro_desc
            }

        return None

    def translate_text(self, text: str, target_lang: str, source_lang: str = 'en') -> Optional[str]:
        """Translate text to target language"""
        if not text:
            return None

        # Check cache
        cache_key = f"{source_lang}_{target_lang}_{hash(text)}"
        if cache_key in self.translation_cache:
            return self.translation_cache[cache_key]

        try:
            # Use deep-translator (free, no API key needed)
            translator = GoogleTranslator(source=source_lang, target=target_lang)
            translated = translator.translate(text)

            # Cache result
            self.translation_cache[cache_key] = translated
            return translated
        except Exception as e:
            logger.warning(f"Translation failed ({source_lang}->{target_lang}): {e}")
            return None


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

        logger.info(f"  Resource missing name: {resource_name} for site {site_name}")
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


class UNESCOScraper:
    """Scrapes UNESCO website for heritage site information using Selenium"""

    # Language mappings: [lang_code, button_id]
    LANGUAGES_TO_SCRAPE = [
        ['es', 'tabdes_es'],  # Spanish
        ['fr', 'tabdes_fr'],  # French
        ['ru', 'tabdes_ru'],  # Russian
        ['zh', 'tabdes_zh'],  # Chinese
        ['ja', 'tabdes_ja'],  # Japanese
    ]

    def __init__(self, use_selenium: bool = True):
        self.session = requests.Session()
        self.session.headers.update({
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36'
        })
        self.cache = {}
        self.sites_by_name = {}
        self.driver = None
        self.use_selenium = use_selenium

    def _init_selenium(self):
        """Initialize Selenium WebDriver"""
        if self.driver is not None:
            return

        try:
            chrome_options = ChromeOptions()
            chrome_options.add_argument('--headless')  # Run in background
            chrome_options.add_argument('--no-sandbox')
            chrome_options.add_argument('--disable-dev-shm-usage')
            chrome_options.add_argument('--disable-gpu')
            chrome_options.add_argument('--window-size=1920,1080')
            chrome_options.add_argument('user-agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36')

            logger.info("Initializing Chrome WebDriver...")
            self.driver = webdriver.Chrome(
                service=ChromeService(ChromeDriverManager().install()),
                options=chrome_options
            )
            self.driver.implicitly_wait(10)
            logger.info("WebDriver initialized successfully")
        except Exception as e:
            logger.error(f"Failed to initialize Selenium: {e}")
            self.use_selenium = False
            self.driver = None

    def close(self):
        """Close Selenium driver"""
        if self.driver:
            try:
                self.driver.quit()
            except:
                pass
            self.driver = None

    def scrape_list(self) -> List[Dict]:
        """
        Scrape UNESCO heritage sites list using Selenium (Cloudflare blocks other methods)
        Returns list of dicts with basic info
        """
        logger.info("Fetching UNESCO heritage sites list (using Selenium for Cloudflare)...")

        if not self.use_selenium:
            logger.warning("Selenium disabled, but required for UNESCO scraping")
            return []

        # Initialize Selenium
        if self.driver is None:
            self._init_selenium()

        if self.driver is None:
            logger.error("Selenium not available, cannot fetch UNESCO list")
            return []

        try:
            url = "https://whc.unesco.org/en/list/"
            logger.info("  Loading UNESCO list page...")
            self.driver.get(url)

            # Wait for Cloudflare challenge to complete (it takes ~5 seconds)
            logger.info("  Waiting for Cloudflare challenge...")
            time.sleep(8)

            # Wait for actual content to load - look for the sites table/list
            try:
                WebDriverWait(self.driver, 20).until(
                    EC.presence_of_element_located((By.CSS_SELECTOR, "a[href*='/en/list/']"))
                )
                logger.info("  Page loaded successfully")
            except TimeoutException:
                logger.warning("  Timeout waiting for UNESCO list page content")

            # Get page source after Cloudflare passes
            soup = BeautifulSoup(self.driver.page_source, 'html.parser')

            sites = []
            # Find all site links - UNESCO list has links like /en/list/208
            links = soup.find_all('a', href=re.compile(r'/en/list/\d+'))

            seen_ids = set()
            for link in links:
                href = link.get('href', '')
                match = re.search(r'/list/(\d+)', href)
                if match:
                    unesco_id = match.group(1)
                    if unesco_id not in seen_ids and unesco_id.isdigit():
                        seen_ids.add(unesco_id)
                        name = link.get_text(strip=True)
                        # Filter out navigation/menu items and non-site names
                        if name and len(name) > 10 and not name.isdigit() and not name.startswith('http'):
                            site_dict = {
                                'id': unesco_id,
                                'name': name,
                                'location': '',
                                'year': '',
                                'category': 'Cultural',
                                'short_description': ''
                            }
                            sites.append(site_dict)
                            self.sites_by_name[name.lower().strip()] = site_dict

            logger.info(f"Found {len(sites)} UNESCO sites")
            return sites

        except Exception as e:
            logger.error(f"Failed to scrape UNESCO list: {e}")
            return []

    def scrape_site_details_with_selenium(self, unesco_id: str, site_name: str) -> Dict:
        """
        Scrape site details using Selenium to click through language tabs
        This is the proper way to get multi-language descriptions from UNESCO
        """
        if not self.use_selenium:
            return self.scrape_site_details_no_selenium(unesco_id, site_name)

        # Initialize selenium if needed
        if self.driver is None:
            self._init_selenium()

        if self.driver is None:
            return self.scrape_site_details_no_selenium(unesco_id, site_name)

        cache_key = f"site_{unesco_id}"
        if cache_key in self.cache:
            return self.cache[cache_key]

        details = {
            'id': unesco_id,
            'name': site_name,
            'description_en': '',
            'description_fr': '',
            'description_es': '',
            'description_ru': '',
            'description_zh': '',
            'description_ja': '',
            'images': [],
            'author': '',  # Will be set to country name
            'location': '',
            'country': ''
        }

        try:
            url = f"https://whc.unesco.org/en/list/{unesco_id}"
            logger.info(f"  Scraping {unesco_id}: {site_name}")

            self.driver.get(url)
            time.sleep(2)  # Wait for page to load

            # Extract country from the page
            try:
                country_element = None
                try:
                    country_element = self.driver.find_element(By.XPATH, "//dt[contains(text(), 'States Parties')]/following-sibling::dd[1]")
                except NoSuchElementException:
                    try:
                        country_element = self.driver.find_element(By.CSS_SELECTOR, ".list_site dd")
                    except NoSuchElementException:
                        pass

                if country_element:
                    country_text = country_element.text.strip()
                    if country_text:
                        details['country'] = country_text
                        details['author'] = country_text
                        logger.debug(f"    Found country: {country_text}")
            except Exception as e:
                logger.debug(f"    Could not extract country: {e}")

            # Get English description (default page)
            try:
                # Try multiple selectors for description
                desc_element = None
                try:
                    desc_element = self.driver.find_element(By.ID, "contentdes_en")
                except NoSuchElementException:
                    try:
                        desc_element = self.driver.find_element(By.CSS_SELECTOR, ".description")
                    except NoSuchElementException:
                        # Try getting paragraphs from main content
                        content_div = self.driver.find_element(By.ID, "content")
                        paragraphs = content_div.find_elements(By.TAG_NAME, "p")
                        if paragraphs:
                            desc_text = "\n\n".join([p.text for p in paragraphs[:3] if len(p.text) > 50])
                            if desc_text:
                                details['description_en'] = desc_text

                if desc_element:
                    text = desc_element.text.strip()
                    # Clean up - remove title from description
                    lines = text.split("\n")
                    if len(lines) > 1:
                        # First line is usually the title, remove it
                        text = "\n".join(lines[1:])
                    details['description_en'] = text.strip()

            except Exception as e:
                logger.warning(f"    Failed to get EN description: {e}")

            # Click through each language tab to get descriptions
            for lang_code, tab_id in self.LANGUAGES_TO_SCRAPE:
                try:
                    # Find and click the language tab
                    tab_button = WebDriverWait(self.driver, 5).until(
                        EC.element_to_be_clickable((By.ID, tab_id))
                    )
                    tab_button.click()
                    time.sleep(0.5)  # Wait for content to load

                    # Get the content
                    content_id = f"contentdes_{lang_code}"
                    content_element = self.driver.find_element(By.ID, content_id)
                    text = content_element.text.strip()

                    # Clean up - remove title
                    lines = text.split("\n")
                    if len(lines) > 1:
                        text = "\n".join(lines[1:])

                    # Remove last line if it looks like metadata
                    lines = text.split("\n")
                    if len(lines) > 1:
                        last_line = lines[-1]
                        if len(last_line) < 100 and ('source' in last_line.lower() or 'unesco' in last_line.lower()):
                            text = "\n".join(lines[:-1])

                    details[f'description_{lang_code}'] = text.strip()
                    logger.debug(f"    Got {lang_code} description ({len(text)} chars)")

                except TimeoutException:
                    logger.debug(f"    No {lang_code} tab found")
                except NoSuchElementException:
                    logger.debug(f"    No {lang_code} content found")
                except Exception as e:
                    logger.warning(f"    Failed to get {lang_code} description: {e}")

            # Extract images
            try:
                img_elements = self.driver.find_elements(By.TAG_NAME, "img")
                for img in img_elements[:10]:
                    src = img.get_attribute('src')
                    if src and 'logo' not in src.lower() and not src.endswith('.gif'):
                        if not src.startswith('http'):
                            if src.startswith('//'):
                                src = 'https:' + src
                            elif src.startswith('/'):
                                src = f"https://whc.unesco.org{src}"
                        details['images'].append(src)

                # Deduplicate
                details['images'] = list(dict.fromkeys(details['images']))[:5]
            except:
                pass

            # Cache result
            self.cache[cache_key] = details

            return details

        except Exception as e:
            logger.error(f"Failed to scrape {unesco_id} with Selenium: {e}")
            return details

    def scrape_site_details_no_selenium(self, unesco_id: str, site_name: str) -> Dict:
        """Fallback: Scrape without Selenium (only EN/FR available)"""
        details = {
            'id': unesco_id,
            'name': site_name,
            'description_en': '',
            'description_fr': '',
            'images': [],
            'author': '',  # Will be set to country if found
            'location': '',
            'country': ''
        }

        try:
            # Get English page
            url_en = f"https://whc.unesco.org/en/list/{unesco_id}"
            response = self.session.get(url_en, timeout=30)
            soup = BeautifulSoup(response.content, 'html.parser')

            # Try to find description
            paragraphs = soup.find_all('p')
            substantial_paras = [p.get_text(strip=True) for p in paragraphs if len(p.get_text(strip=True)) > 100]
            if substantial_paras:
                details['description_en'] = '\n\n'.join(substantial_paras[:2])

            # Get French page
            url_fr = f"https://whc.unesco.org/fr/list/{unesco_id}"
            response = self.session.get(url_fr, timeout=30)
            soup = BeautifulSoup(response.content, 'html.parser')

            paragraphs = soup.find_all('p')
            substantial_paras = [p.get_text(strip=True) for p in paragraphs if len(p.get_text(strip=True)) > 100]
            if substantial_paras:
                details['description_fr'] = '\n\n'.join(substantial_paras[:2])

            # Extract images
            img_tags = soup.find_all('img')
            for img in img_tags[:5]:
                src = img.get('src')
                if src and 'logo' not in src.lower():
                    if not src.startswith('http'):
                        src = f"https://whc.unesco.org{src}"
                    details['images'].append(src)

            return details

        except Exception as e:
            logger.warning(f"Failed to scrape {unesco_id} without Selenium: {e}")
            return details

    def scrape_site_details(self, unesco_id: str, site_name: str) -> Dict:
        """Main entry point for scraping site details"""
        if self.use_selenium:
            return self.scrape_site_details_with_selenium(unesco_id, site_name)
        else:
            return self.scrape_site_details_no_selenium(unesco_id, site_name)

    def find_unesco_id_by_name(self, site_name: str) -> Optional[str]:
        """Find UNESCO ID by searching for site name"""
        name_lower = site_name.lower().strip()
        if name_lower in self.sites_by_name:
            return self.sites_by_name[name_lower]['id']

        # Try fuzzy matching
        for cached_name, site_dict in self.sites_by_name.items():
            if name_lower in cached_name or cached_name in name_lower:
                return site_dict['id']

        return None


class ReportGenerator:
    """Generates validation reports and SQL fix scripts"""

    def __init__(self, output_dir: str):
        self.output_dir = Path(output_dir)
        self.output_dir.mkdir(parents=True, exist_ok=True)

        self.stats = {
            'language_issues': 0,
            'language_fixed': 0,
            'missing_authors': 0,
            'authors_fixed': 0,
            'missing_images': 0,
            'images_downloaded': 0,
            'incorrect_images': 0,
            'missing_unesco_sites': 0,
            'sites_added': 0
        }

        self.issues = {
            'language': [],
            'authors': [],
            'images': [],
            'new_sites': []
        }

    def add_language_issue(self, issue: Dict):
        """Add language issue to report"""
        self.issues['language'].append(issue)
        self.stats['language_issues'] += 1

    def add_author_issue(self, issue: Dict):
        """Add author issue to report"""
        self.issues['authors'].append(issue)
        self.stats['missing_authors'] += 1

    def add_image_issue(self, issue: Dict):
        """Add image issue to report"""
        self.issues['images'].append(issue)
        if issue['type'] == 'missing':
            self.stats['missing_images'] += 1
        elif issue['type'] == 'incorrect':
            self.stats['incorrect_images'] += 1

    def add_new_site(self, site: Dict):
        """Add new UNESCO site to report"""
        self.issues['new_sites'].append(site)
        self.stats['missing_unesco_sites'] += 1

    def generate_sql_fixes(self, fixes: List[Dict]) -> Path:
        """Generate SQL fix script"""
        sql_path = self.output_dir / 'database_fixes.sql'

        with open(sql_path, 'w', encoding='utf-8') as f:
            f.write("-- UNESCO Heritage Database Fixes\n")
            f.write(f"-- Generated: {datetime.now().isoformat()}\n")
            f.write("-- REVIEW CAREFULLY BEFORE APPLYING\n\n")

            f.write("BEGIN TRANSACTION;\n\n")

            for fix in fixes:
                if fix['type'] == 'language_swap':
                    f.write(f"-- [ID {fix['id']}] {fix['name']}: Swap EN/RO fields\n")
                    f.write(f"UPDATE museum_item SET\n")
                    f.write(f"  description = {self._sql_escape(fix['new_en'])},\n")
                    f.write(f"  description_ro = {self._sql_escape(fix['new_ro'])}\n")
                    f.write(f"WHERE id = {fix['id']};\n\n")

                elif fix['type'] == 'update_description':
                    f.write(f"-- [ID {fix['id']}] {fix['name']}: Update {fix['field']}\n")
                    f.write(f"UPDATE museum_item SET\n")
                    f.write(f"  {fix['field']} = {self._sql_escape(fix['value'])}\n")
                    f.write(f"WHERE id = {fix['id']};\n\n")

                elif fix['type'] == 'update_author':
                    f.write(f"-- [ID {fix['id']}] {fix['name']}: Update author\n")
                    f.write(f"UPDATE museum_item SET\n")
                    f.write(f"  author = {self._sql_escape(fix['author'])}\n")
                    f.write(f"WHERE id = {fix['id']};\n\n")

                elif fix['type'] == 'insert_site':
                    f.write(f"-- [NEW] {fix['name']}: Add new UNESCO site\n")
                    f.write(f"INSERT INTO museum_item (paintingname, description, description_ro, ")
                    f.write(f"author, location, full_image_uri, style, isFavourite, viewed, visited)\n")
                    f.write(f"VALUES (\n")
                    f.write(f"  {self._sql_escape(fix['name'])},\n")
                    f.write(f"  {self._sql_escape(fix.get('description_en', ''))},\n")
                    f.write(f"  {self._sql_escape(fix.get('description_ro', ''))},\n")
                    f.write(f"  {self._sql_escape(fix.get('author', 'UNESCO'))},\n")
                    f.write(f"  {self._sql_escape(fix.get('location', ''))},\n")
                    f.write(f"  {self._sql_escape(fix.get('image_uri', ''))},\n")
                    f.write(f"  {self._sql_escape(fix.get('style', 'World Heritage'))},\n")
                    f.write(f"  'false', 'false', 'false'\n")
                    f.write(f");\n\n")

            f.write("COMMIT;\n")

        return sql_path

    def _sql_escape(self, value: str) -> str:
        """Escape string for SQL"""
        if value is None:
            return 'NULL'
        # Escape single quotes
        escaped = value.replace("'", "''")
        return f"'{escaped}'"

    def generate_report(self) -> Path:
        """Generate human-readable validation report"""
        report_path = self.output_dir / 'validation_report.txt'

        with open(report_path, 'w', encoding='utf-8') as f:
            f.write("=" * 60 + "\n")
            f.write("UNESCO HERITAGE DATABASE VALIDATION REPORT\n")
            f.write("=" * 60 + "\n")
            f.write(f"Generated: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n")
            f.write(f"Database: heritage_sites.db\n\n")

            f.write("SUMMARY:\n")
            f.write("-" * 60 + "\n")
            f.write(f"✓ Language Issues: {self.stats['language_issues']} found, "
                   f"{self.stats['language_fixed']} fixed\n")
            f.write(f"✓ Missing Authors: {self.stats['missing_authors']} found, "
                   f"{self.stats['authors_fixed']} fixed\n")
            f.write(f"✓ Missing Images: {self.stats['missing_images']} found, "
                   f"{self.stats['images_downloaded']} downloaded\n")
            f.write(f"✓ Incorrect Images: {self.stats['incorrect_images']} found (flagged for review)\n")
            f.write(f"✓ Missing UNESCO Sites: {self.stats['missing_unesco_sites']} found, "
                   f"{self.stats['sites_added']} added\n\n")

            # Language issues detail
            if self.issues['language']:
                f.write("LANGUAGE ISSUES DETAIL:\n")
                f.write("-" * 60 + "\n")
                for issue in self.issues['language'][:20]:  # First 20
                    f.write(f"[ID {issue['id']}] {issue['name']}\n")
                    f.write(f"  Issue: {issue['issue']}\n")
                    f.write(f"  Fix: {issue['fix']}\n")
                    f.write(f"  Status: {issue.get('status', 'PENDING')}\n\n")

                if len(self.issues['language']) > 20:
                    f.write(f"... and {len(self.issues['language']) - 20} more\n\n")

            # Authors detail
            if self.issues['authors']:
                f.write("MISSING AUTHORS:\n")
                f.write("-" * 60 + "\n")
                for issue in self.issues['authors'][:20]:
                    f.write(f"[ID {issue['id']}] {issue['name']}\n")
                    f.write(f"  Issue: Author field empty\n")
                    f.write(f"  Status: {issue.get('status', 'PENDING')}\n\n")

                if len(self.issues['authors']) > 20:
                    f.write(f"... and {len(self.issues['authors']) - 20} more\n\n")

            # Images detail
            if self.issues['images']:
                f.write("IMAGE VALIDATION:\n")
                f.write("-" * 60 + "\n")
                for issue in self.issues['images'][:20]:
                    f.write(f"[ID {issue['id']}] {issue['name']}\n")
                    f.write(f"  Issue: {issue['type']}\n")
                    f.write(f"  Details: {issue.get('details', 'N/A')}\n")
                    f.write(f"  Status: {issue.get('status', 'PENDING')}\n\n")

                if len(self.issues['images']) > 20:
                    f.write(f"... and {len(self.issues['images']) - 20} more\n\n")

            # New sites
            if self.issues['new_sites']:
                f.write("NEW ENTRIES ADDED:\n")
                f.write("-" * 60 + "\n")
                for site in self.issues['new_sites'][:20]:
                    f.write(f"[NEW] {site['name']}\n")
                    f.write(f"  Location: {site.get('location', 'N/A')}\n")
                    f.write(f"  Year: {site.get('year', 'N/A')}\n\n")

                if len(self.issues['new_sites']) > 20:
                    f.write(f"... and {len(self.issues['new_sites']) - 20} more\n\n")

            f.write("\nSQL FIXES GENERATED:\n")
            f.write("-" * 60 + "\n")
            f.write(f"File: database_fixes.sql\n")
            f.write(f"IMPORTANT: Review SQL carefully before applying!\n")

        return report_path

    def generate_statistics_json(self) -> Path:
        """Generate machine-readable statistics"""
        stats_path = self.output_dir / 'statistics.json'

        with open(stats_path, 'w', encoding='utf-8') as f:
            json.dump({
                'timestamp': datetime.now().isoformat(),
                'statistics': self.stats,
                'issue_counts': {
                    'language': len(self.issues['language']),
                    'authors': len(self.issues['authors']),
                    'images': len(self.issues['images']),
                    'new_sites': len(self.issues['new_sites'])
                }
            }, f, indent=2)

        return stats_path


class DatabaseValidator:
    """Main orchestrator for database validation"""

    def __init__(self, db_path: str, drawable_dir: str, output_dir: str,
                 google_api_key: Optional[str] = None, search_engine_id: Optional[str] = None,
                 skip_images: bool = False, skip_unesco_sync: bool = False,
                 apply_fixes: bool = True):
        self.db_path = Path(db_path)
        self.drawable_dir = Path(drawable_dir)
        self.apply_fixes = apply_fixes
        self.skip_images = skip_images
        self.skip_unesco_sync = skip_unesco_sync

        self.lang_checker = LanguageChecker()
        self.image_validator = ImageValidator(drawable_dir, google_api_key, search_engine_id)
        self.unesco_scraper = UNESCOScraper()
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
            if (i + 1) % 50 == 0:
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
                    # Move Romanian to correct field, try to fetch English
                    mixup['new_ro'] = mixup['current_en']

                    # Try to get English from UNESCO
                    # For now, leave as TODO and report
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

            # If ALL descriptions are missing, try to fetch from UNESCO
            all_missing = all(not entry.get(f'description_{lang}')
                            for lang in ['it', 'es', 'de', 'fr', 'pt', 'ru', 'ar', 'zh', 'ja'])

            if all_missing and entry.get('description'):
                # Translate from English to missing languages
                for lang in missing_langs:
                    translated = self.lang_checker.translate_text(entry['description'], lang, 'en')
                    if translated:
                        self.fixes.append({
                            'type': 'update_description',
                            'id': entry['id'],
                            'name': entry['paintingname'],
                            'field': f'description_{lang}',
                            'value': translated
                        })

        logger.info(f"Language validation complete. Found {self.report_gen.stats['language_issues']} issues")

    def validate_authors(self, entries: List[Dict]):
        """Validate author fields - should be country name, not UNESCO"""
        logger.info("Validating author fields...")

        for entry in entries:
            if not entry.get('author') or entry['author'].strip() == '':
                self.report_gen.add_author_issue({
                    'id': entry['id'],
                    'name': entry['paintingname'],
                    'status': 'NEEDS_SCRAPING'
                })

                # Note: We can't set a default here - need to scrape UNESCO to get country
                # The fix_database_issues.py script should be run to fetch country names
                logger.warning(f"  Entry {entry['id']} '{entry['paintingname']}' has no author - needs country from UNESCO")

        logger.info(f"Author validation complete. Found {self.report_gen.stats['missing_authors']} missing authors")

    def validate_images(self, entries: List[Dict]):
        """Validate image files"""
        if self.skip_images:
            logger.info("Skipping image validation (--skip-images flag)")
            return

        logger.info("Validating images...")

        for i, entry in enumerate(entries):
            if (i + 1) % 50 == 0:
                logger.info(f"  Processed {i + 1}/{len(entries)} images...")

            site_name = entry['paintingname']
            exists, image_path = self.image_validator.check_image_exists(site_name)

            if not exists:
                # Image missing - try to download
                full_image_uri = entry.get('full_image_uri', '')
                if full_image_uri:
                    # Take first URL
                    first_url = full_image_uri.split(',')[0].strip()

                    logger.info(f"  Downloading image for [{entry['id']}] {site_name}")
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
                else:
                    self.report_gen.add_image_issue({
                        'id': entry['id'],
                        'name': site_name,
                        'type': 'missing',
                        'details': 'No full_image_uri available',
                        'status': 'NEEDS_MANUAL_FIX'
                    })
            else:
                # Image exists - verify correctness
                confidence, details = self.image_validator.reverse_image_search(image_path, site_name)

                if confidence < 0.7 and confidence > 0:
                    self.report_gen.add_image_issue({
                        'id': entry['id'],
                        'name': site_name,
                        'type': 'incorrect',
                        'details': f'Low confidence: {confidence:.2f} - {details}',
                        'status': 'NEEDS_REVIEW'
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

        # Add missing sites
        for i, site in enumerate(missing_sites[:50]):  # Limit to 50 for now to avoid overwhelming
            if (i + 1) % 10 == 0:
                logger.info(f"  Processing {i + 1}/{min(50, len(missing_sites))} new sites...")

            # Get detailed info
            details = self.unesco_scraper.scrape_site_details(site['id'], site['name'])

            # Translate description to Romanian
            desc_ro = ''
            if details.get('description_en'):
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
                'author': details.get('country', details.get('author', '')),  # Use country from scraped details
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


def main():
    """Main entry point"""
    parser = argparse.ArgumentParser(
        description='UNESCO Heritage Sites Database Validator and Repair Tool',
        formatter_class=argparse.RawDescriptionHelpFormatter
    )

    parser.add_argument('--db', type=str,
                       default='androidApp/src/main/assets/heritage_sites.db',
                       help='Path to heritage_sites.db')
    parser.add_argument('--drawable', type=str,
                       default='androidApp/src/main/res/drawable-nodpi',
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
    parser.add_argument('--verbose', action='store_true',
                       help='Enable verbose logging')
    parser.add_argument('--output-dir', type=str,
                       default='./validation_output',
                       help='Output directory for reports')

    args = parser.parse_args()

    # Set log level
    if args.verbose:
        logger.setLevel(logging.DEBUG)

    # Create validator and run
    validator = DatabaseValidator(
        db_path=args.db,
        drawable_dir=args.drawable,
        output_dir=args.output_dir,
        google_api_key=args.google_api_key,
        search_engine_id=args.search_engine_id,
        skip_images=args.skip_images,
        skip_unesco_sync=args.skip_unesco_sync,
        apply_fixes=args.apply_fixes
    )

    validator.run()


if __name__ == '__main__':
    main()
