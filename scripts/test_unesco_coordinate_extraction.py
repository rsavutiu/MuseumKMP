"""
Test script to extract coordinates from UNESCO pages using Selenium
Shows the actual patterns found on the UNESCO website
"""
import re
import time
from selenium import webdriver
from selenium.webdriver.chrome.service import Service as ChromeService
from selenium.webdriver.chrome.options import Options as ChromeOptions
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.by import By
from webdriver_manager.chrome import ChromeDriverManager

def extract_coordinates_from_unesco(unesco_id: str = "230"):
    """Extract coordinates from UNESCO site using Selenium"""

    print(f"\n{'='*80}")
    print(f"Analyzing UNESCO Site {unesco_id}")
    print(f"{'='*80}\n")

    # Initialize Chrome with headless mode
    chrome_options = ChromeOptions()
    chrome_options.add_argument('--headless')
    chrome_options.add_argument('--no-sandbox')
    chrome_options.add_argument('--disable-dev-shm-usage')
    chrome_options.add_argument('--disable-gpu')
    chrome_options.add_argument('--window-size=1920,1080')
    chrome_options.add_argument('user-agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36')

    # Disable images for faster loading
    prefs = {"profile.managed_default_content_settings.images": 2}
    chrome_options.add_experimental_option("prefs", prefs)

    driver = None

    try:
        print("Initializing Chrome WebDriver...")
        driver = webdriver.Chrome(
            service=ChromeService(ChromeDriverManager().install()),
            options=chrome_options
        )
        driver.implicitly_wait(10)
        print("WebDriver initialized\n")

        # Test both main page and maps page
        urls_to_test = [
            (f"https://whc.unesco.org/en/list/{unesco_id}/", "MAIN PAGE"),
            (f"https://whc.unesco.org/en/list/{unesco_id}/maps/", "MAPS PAGE"),
        ]

        for url, url_type in urls_to_test:
            print(f"\n{'-'*80}")
            print(f"Fetching {url_type}: {url}")
            print(f"{'-'*80}\n")

            try:
                driver.get(url)

                # Wait for Cloudflare challenge
                print("Waiting for Cloudflare challenge...")
                time.sleep(8)

                # Wait for page content
                try:
                    WebDriverWait(driver, 20).until(
                        EC.presence_of_element_located((By.TAG_NAME, "body"))
                    )
                    print("Page loaded successfully\n")
                except:
                    print("Warning: Page load timeout\n")

                html = driver.page_source

                # 1. Look for DMS format (Degrees Minutes Seconds)
                print("### 1. DMS FORMAT (Degrees Minutes Seconds) ###")
                dms_pattern = r'([NS])\s*(\d+)\s+(\d+)\s+([\d\.]+)\s+([EW])\s*(\d+)\s+(\d+)\s+([\d\.]+)'
                dms_matches = re.findall(dms_pattern, html)
                if dms_matches:
                    print(f"Found {len(dms_matches)} DMS coordinate sets:")
                    for match in dms_matches[:5]:
                        lat_dir, lat_deg, lat_min, lat_sec, lng_dir, lng_deg, lng_min, lng_sec = match
                        print(f"  Lat: {lat_dir} {lat_deg}° {lat_min}' {lat_sec}\"  Lng: {lng_dir} {lng_deg}° {lng_min}' {lng_sec}\"")

                        # Convert to decimal
                        lat_decimal = float(lat_deg) + (float(lat_min) / 60.0) + (float(lat_sec) / 3600.0)
                        if lat_dir == 'S':
                            lat_decimal = -lat_decimal

                        lng_decimal = float(lng_deg) + (float(lng_min) / 60.0) + (float(lng_sec) / 3600.0)
                        if lng_dir == 'W':
                            lng_decimal = -lng_decimal

                        # Format with commas (as used in database)
                        location = f"{str(lng_decimal).replace('.', ',')},{str(lat_decimal).replace('.', ',')}"
                        print(f"  Converted to database format: {location}")
                else:
                    print("No DMS coordinates found")

                # 2. Look for JavaScript variables
                print("\n### 2. JAVASCRIPT VARIABLES ###")
                js_var_patterns = [
                    (r'var\s+(\w*[Ll]at\w*)\s*=\s*([+-]?\d+\.?\d*)', "var latitude"),
                    (r'var\s+(\w*[Ll]ng\w*|[Ll]on\w*)\s*=\s*([+-]?\d+\.?\d*)', "var longitude"),
                ]

                found_js_vars = False
                for pattern, desc in js_var_patterns:
                    matches = re.findall(pattern, html, re.IGNORECASE)
                    if matches:
                        found_js_vars = True
                        print(f"{desc}:")
                        for var_name, value in matches[:5]:
                            print(f"  {var_name} = {value}")

                if not found_js_vars:
                    print("No JavaScript coordinate variables found")

                # 3. Look for JSON/object properties
                print("\n### 3. JSON/OBJECT PROPERTIES ###")
                obj_patterns = [
                    (r'(?:lat|latitude)["\']?\s*[:=]\s*([+-]?\d+\.?\d*)', "lat/latitude property"),
                    (r'(?:lng|lon|longitude)["\']?\s*[:=]\s*([+-]?\d+\.?\d*)', "lng/lon/longitude property"),
                ]

                found_props = False
                for pattern, desc in obj_patterns:
                    matches = re.findall(pattern, html, re.IGNORECASE)
                    if matches:
                        found_props = True
                        print(f"{desc}:")
                        for value in matches[:5]:
                            print(f"  {value}")

                if not found_props:
                    print("No JSON/object coordinate properties found")

                # 4. Look for center coordinates
                print("\n### 4. MAP CENTER PATTERNS ###")
                center_patterns = [
                    (r'center["\']?\s*[:=]\s*\[([+-]?\d+\.?\d*)\s*,\s*([+-]?\d+\.?\d*)\]', "center: [val1, val2]"),
                    (r'setView\(\[([+-]?\d+\.?\d*)\s*,\s*([+-]?\d+\.?\d*)\]', "setView([val1, val2])"),
                ]

                found_center = False
                for pattern, desc in center_patterns:
                    matches = re.findall(pattern, html, re.IGNORECASE)
                    if matches:
                        found_center = True
                        print(f"{desc}:")
                        for val1, val2 in matches[:5]:
                            print(f"  [{val1}, {val2}]")
                            # Determine which is lng and which is lat
                            v1, v2 = float(val1), float(val2)
                            if -90 <= v1 <= 90 and -180 <= v2 <= 180:
                                # v1 might be lat, v2 might be lng
                                if abs(v1) < abs(v2):  # latitude is usually smaller in absolute value
                                    print(f"    Likely: lat={v1}, lng={v2}")
                                    location = f"{str(v2).replace('.', ',')},{str(v1).replace('.', ',')}"
                                else:
                                    print(f"    Likely: lng={v1}, lat={v2}")
                                    location = f"{str(v1).replace('.', ',')},{str(v2).replace('.', ',')}"
                                print(f"    Database format: {location}")

                if not found_center:
                    print("No map center coordinates found")

                # 5. Look for coordinate pairs
                print("\n### 5. DECIMAL COORDINATE PAIRS ###")
                coord_pattern = r'([+-]?\d{1,3}\.\d{3,})\s*[,;]\s*([+-]?\d{1,3}\.\d{3,})'
                coord_matches = re.findall(coord_pattern, html)
                if coord_matches:
                    valid_coords = []
                    for val1, val2 in coord_matches:
                        v1, v2 = float(val1), float(val2)
                        # Check if could be valid coordinates
                        if (-90 <= v1 <= 90 and -180 <= v2 <= 180) or (-90 <= v2 <= 90 and -180 <= v1 <= 180):
                            valid_coords.append((val1, val2))

                    if valid_coords:
                        print(f"Found {len(valid_coords)} valid coordinate pairs:")
                        for val1, val2 in valid_coords[:10]:
                            print(f"  {val1}, {val2}")
                    else:
                        print("No valid coordinate pairs found")
                else:
                    print("No decimal coordinate pairs found")

                # 6. Search for specific JavaScript snippets
                print("\n### 6. JAVASCRIPT CODE SNIPPETS (containing 'lat' or 'lng') ###")
                # Extract script tags and look for map initialization code
                script_pattern = r'<script[^>]*>(.*?)</script>'
                scripts = re.findall(script_pattern, html, re.DOTALL | re.IGNORECASE)

                found_map_script = False
                for i, script in enumerate(scripts):
                    if ('map' in script.lower() or 'leaflet' in script.lower()) and ('lat' in script.lower() or 'lng' in script.lower()):
                        found_map_script = True
                        # Get lines containing lat/lng/center
                        lines = script.split('\n')
                        relevant_lines = [line.strip() for line in lines
                                        if any(keyword in line.lower()
                                             for keyword in ['lat', 'lng', 'lon', 'center', 'setview', 'latlng'])]

                        if relevant_lines:
                            print(f"\nScript block #{i+1} (relevant lines):")
                            for line in relevant_lines[:15]:
                                if len(line) > 0 and len(line) < 150:
                                    print(f"  {line}")

                if not found_map_script:
                    print("No map initialization scripts found")

            except Exception as e:
                print(f"Error fetching {url_type}: {e}")

    except Exception as e:
        print(f"Error initializing WebDriver: {e}")

    finally:
        if driver:
            driver.quit()
            print(f"\n{'='*80}")
            print("WebDriver closed")
            print(f"{'='*80}\n")

if __name__ == "__main__":
    # Test with UNESCO site 230 (as requested)
    extract_coordinates_from_unesco("230")
