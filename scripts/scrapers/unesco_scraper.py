"""
UNESCO World Heritage Sites Scraper

Scrapes heritage site information from whc.unesco.org using Selenium
to bypass Cloudflare protection and click through language tabs.
"""

import re
import time
import logging
from typing import Dict, List, Optional

import requests
from bs4 import BeautifulSoup
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.chrome.service import Service as ChromeService
from selenium.webdriver.chrome.options import Options as ChromeOptions
from webdriver_manager.chrome import ChromeDriverManager
from selenium.common.exceptions import TimeoutException, NoSuchElementException, ElementClickInterceptedException
from selenium.webdriver.common.action_chains import ActionChains

logger = logging.getLogger(__name__)


class UNESCOScraper:
    """Scrapes UNESCO website for heritage site information using Selenium"""

    # Language mappings: [lang_code, tab_id]
    LANGUAGES_TO_SCRAPE = [
        ['fr', 'tabdes_fr'],  # French
        ['es', 'tabdes_es'],  # Spanish
        ['ru', 'tabdes_ru'],  # Russian
        ['zh', 'tabdes_zh'],  # Chinese
        ['ja', 'tabdes_ja'],  # Japanese
        ['pt', 'tabdes_pt'],  # Portuguese
        ['de', 'tabdes_de'],  # German
        ['it', 'tabdes_it'],  # Italian
        ['ar', 'tabdes_ar'],  # Arabic
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
            chrome_options.add_argument('--disable-blink-features=AutomationControlled')
            chrome_options.add_argument('user-agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36')

            # Disable images for faster loading
            prefs = {"profile.managed_default_content_settings.images": 2}
            chrome_options.add_experimental_option("prefs", prefs)

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

    def _dismiss_popups(self):
        """Dismiss any popups, cookie banners, or modals that might be blocking clicks"""
        try:
            # Try to find and dismiss cookie consent
            cookie_buttons = [
                "//button[contains(text(), 'Accept')]",
                "//button[contains(text(), 'Agree')]",
                "//button[contains(@class, 'cookie')]",
                "//a[contains(@class, 'close')]",
                "//button[contains(@class, 'close')]",
            ]

            for xpath in cookie_buttons:
                try:
                    button = self.driver.find_element(By.XPATH, xpath)
                    button.click()
                    logger.debug("Dismissed popup/modal")
                    time.sleep(0.5)
                    break
                except:
                    continue

        except Exception as e:
            logger.debug(f"No popups to dismiss: {e}")

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

            # Wait for Cloudflare challenge to complete
            logger.info("  Waiting for Cloudflare challenge...")
            time.sleep(8)

            # Wait for actual content to load
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

    def scrape_site_details(self, unesco_id: str, site_name: str) -> Dict:
        """
        Scrape site details using Selenium to click through language tabs
        Returns dict with descriptions in multiple languages, images, etc.
        """
        if not self.use_selenium:
            return self._scrape_site_fallback(unesco_id, site_name)

        # Initialize selenium if needed
        if self.driver is None:
            self._init_selenium()

        if self.driver is None:
            return self._scrape_site_fallback(unesco_id, site_name)

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
            'description_pt': '',
            'description_de': '',
            'description_it': '',
            'description_ar': '',
            'images': [],
            'author': '',  # Will be set to country name when scraped
            'location': '',
            'country': ''
        }

        try:
            url = f"https://whc.unesco.org/en/list/{unesco_id}"
            logger.info(f"  Scraping {unesco_id}: {site_name}")

            self.driver.get(url)
            time.sleep(3)  # Wait for page to load including any scripts

            # Dismiss any popups that might block clicks
            self._dismiss_popups()

            # Extract country/countries from the page
            try:
                # UNESCO pages typically have country info in specific elements
                # Try multiple selectors to find country information
                country_element = None
                try:
                    # Try finding "States Parties" section which lists countries
                    country_element = self.driver.find_element(By.XPATH, "//dt[contains(text(), 'States Parties')]/following-sibling::dd[1]")
                except NoSuchElementException:
                    try:
                        # Alternative: Look for country in metadata
                        country_element = self.driver.find_element(By.CSS_SELECTOR, ".list_site dd")
                    except NoSuchElementException:
                        pass

                if country_element:
                    country_text = country_element.text.strip()
                    if country_text:
                        details['country'] = country_text
                        details['author'] = country_text  # Set author to country name
                        logger.debug(f"    Found country: {country_text}")
            except Exception as e:
                logger.debug(f"    Could not extract country: {e}")

            # Get English description (default page)
            try:
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
                        text = "\n".join(lines[1:])
                    details['description_en'] = text.strip()

            except Exception as e:
                logger.warning(f"    Failed to get EN description: {e}")

            # Click through each language tab to get descriptions
            for lang_code, tab_id in self.LANGUAGES_TO_SCRAPE:
                try:
                    # Scroll to the tab to make sure it's visible
                    try:
                        tab_button = self.driver.find_element(By.ID, tab_id)
                        self.driver.execute_script("arguments[0].scrollIntoView(true);", tab_button)
                        time.sleep(0.3)

                        # Try to click using JavaScript if regular click fails
                        try:
                            WebDriverWait(self.driver, 3).until(
                                EC.element_to_be_clickable((By.ID, tab_id))
                            )
                            tab_button.click()
                        except (TimeoutException, ElementClickInterceptedException):
                            # Use JavaScript click as fallback
                            self.driver.execute_script("arguments[0].click();", tab_button)

                        time.sleep(0.8)  # Wait for content to load

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

                        if text and len(text) > 50:  # Only save if substantial
                            details[f'description_{lang_code}'] = text.strip()
                            logger.info(f"    ✓ Got {lang_code} description ({len(text)} chars)")
                        else:
                            logger.info(f"    ✗ {lang_code} description too short or empty")

                    except NoSuchElementException:
                        logger.debug(f"    ✗ No {lang_code} tab found")

                except Exception as e:
                    logger.warning(f"    ✗ Failed to get {lang_code} description: {e}")

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

    def _scrape_site_fallback(self, unesco_id: str, site_name: str) -> Dict:
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
