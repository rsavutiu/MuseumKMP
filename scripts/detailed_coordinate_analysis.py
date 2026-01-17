"""
Detailed analysis of UNESCO coordinate extraction patterns
"""
import re
import time
from selenium import webdriver
from selenium.webdriver.chrome.service import Service as ChromeService
from selenium.webdriver.chrome.options import Options as ChromeOptions
from webdriver_manager.chrome import ChromeDriverManager

def detailed_coordinate_analysis(unesco_id: str = "230"):
    """Extract and display exact coordinate patterns"""

    print(f"\n{'='*80}")
    print(f"DETAILED COORDINATE ANALYSIS FOR UNESCO SITE {unesco_id}")
    print(f"{'='*80}\n")

    chrome_options = ChromeOptions()
    chrome_options.add_argument('--headless')
    chrome_options.add_argument('--no-sandbox')
    chrome_options.add_argument('--disable-dev-shm-usage')
    chrome_options.add_argument('user-agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36')
    prefs = {"profile.managed_default_content_settings.images": 2}
    chrome_options.add_experimental_option("prefs", prefs)

    driver = None

    try:
        driver = webdriver.Chrome(
            service=ChromeService(ChromeDriverManager().install()),
            options=chrome_options
        )

        url = f"https://whc.unesco.org/en/list/{unesco_id}/"
        print(f"Fetching: {url}\n")
        driver.get(url)
        time.sleep(8)

        html = driver.page_source

        print("="*80)
        print("COORDINATE STORAGE FORMATS FOUND")
        print("="*80)

        # 1. DMS (Degrees Minutes Seconds) Format
        print("\n1. DMS FORMAT (in HTML)")
        print("-" * 40)
        dms_pattern = r'([NS])\s*(\d+)\s+(\d+)\s+([\d\.]+)\s+([EW])\s*(\d+)\s+(\d+)\s+([\d\.]+)'
        dms_matches = re.findall(dms_pattern, html)

        if dms_matches:
            for match in dms_matches:
                lat_dir, lat_deg, lat_min, lat_sec, lng_dir, lng_deg, lng_min, lng_sec = match

                print(f"\nOriginal DMS String:")
                print(f"  {lat_dir} {lat_deg} {lat_min} {lat_sec} {lng_dir} {lng_deg} {lng_min} {lng_sec}")

                # Convert to decimal
                lat_decimal = float(lat_deg) + (float(lat_min) / 60.0) + (float(lat_sec) / 3600.0)
                if lat_dir == 'S':
                    lat_decimal = -lat_decimal

                lng_decimal = float(lng_deg) + (float(lng_min) / 60.0) + (float(lng_sec) / 3600.0)
                if lng_dir == 'W':
                    lng_decimal = -lng_decimal

                print(f"\nDecimal Conversion:")
                print(f"  Latitude:  {lat_decimal}")
                print(f"  Longitude: {lng_decimal}")

                # Database format (commas instead of periods, lng first)
                location = f"{str(lng_decimal).replace('.', ',')},{str(lat_decimal).replace('.', ',')}"
                print(f"\nDatabase Format (lng,lat with commas):")
                print(f"  {location}")
        else:
            print("Not found on this page")

        # 2. JavaScript CENTROIDRESULT pattern
        print("\n\n2. JAVASCRIPT CENTROIDRESULT PATTERN")
        print("-" * 40)
        centroid_pattern = r'CENTROIDRESULT\s*\.?\s*(?:LONGITUDE|LATITUDE)[^\d]*([\d.]+)[^\d]*([\d.]+)'
        centroid_matches = re.findall(centroid_pattern, html, re.IGNORECASE)

        if centroid_matches:
            print("Found CENTROIDRESULT usage in JavaScript:")
            for match in centroid_matches[:3]:
                print(f"  Values: {match}")
        else:
            print("Not found on this page")

        # Check for the specific pattern from the output
        response_pattern = r'response\.data\.CENTROIDRESULT\.(LONGITUDE|LATITUDE)'
        response_matches = re.findall(response_pattern, html, re.IGNORECASE)
        if response_matches:
            print("\nFound in code pattern:")
            print("  appConfig.mapView.center=[response.data.CENTROIDRESULT.LONGITUDE, response.data.CENTROIDRESULT.LATITUDE]")
            print("\nThis suggests:")
            print("  - Coordinates come from an API response")
            print("  - Format: [longitude, latitude] (lng first!)")
            print("  - Used to center the map view")

        # 3. Point objects with latitude/longitude
        print("\n\n3. JAVASCRIPT POINT OBJECTS")
        print("-" * 40)
        point_patterns = [
            r'latitude\s*:\s*point\.latitude',
            r'longitude\s*:\s*point\.longitude',
            r'\[\s*onePoint\.longitude\s*,\s*onePoint\.latitude\s*\]',
        ]

        for pattern in point_patterns:
            if re.search(pattern, html, re.IGNORECASE):
                print(f"Found pattern: {pattern}")

        # Extract surrounding context
        target_pattern = r'target:\s*\[\s*onePoint\.longitude\s*,\s*onePoint\.latitude\s*\]'
        if re.search(target_pattern, html, re.IGNORECASE):
            print("\nFound coordinate usage:")
            print("  target: [onePoint.longitude, onePoint.latitude]")
            print("\nThis confirms:")
            print("  - Points have .latitude and .longitude properties")
            print("  - Array format uses [longitude, latitude] order")

        # 4. Look for actual coordinate values
        print("\n\n4. ACTUAL COORDINATE VALUES")
        print("-" * 40)

        # Main page coordinates
        coord_pair_pattern = r'([\d\.]+)\s*,\s*([\d\.]+)'
        lines = html.split('\n')

        found_coords = []
        for line in lines:
            if ('lat' in line.lower() or 'lng' in line.lower() or 'lon' in line.lower()) and \
               re.search(r'\d+\.\d{4,}', line):
                matches = re.findall(r'([\d\.]{6,})', line)
                if matches:
                    for match in matches:
                        try:
                            val = float(match)
                            if (-90 <= val <= 90) or (-180 <= val <= 180):
                                found_coords.append((match, line[:100]))
                        except:
                            pass

        if found_coords:
            print("Coordinate values found in context:")
            seen = set()
            for val, context in found_coords[:10]:
                if val not in seen:
                    seen.add(val)
                    print(f"  {val}")
                    if len(context.strip()) > 0:
                        print(f"    Context: {context.strip()[:80]}...")
        else:
            print("No coordinate values found in JavaScript")

        # 5. Summary
        print("\n\n" + "="*80)
        print("SUMMARY: HOW COORDINATES ARE STORED")
        print("="*80)

        print("\nOn UNESCO Pages:")
        print("  1. HTML/Text: DMS format (N 46 33 52.992 E 0 51 57.996)")
        print("     - Found in page metadata or description")
        print("     - Needs conversion to decimal")
        print("")
        print("  2. JavaScript API Response: decimal format")
        print("     - Accessed via: response.data.CENTROIDRESULT.LONGITUDE")
        print("     - Accessed via: response.data.CENTROIDRESULT.LATITUDE")
        print("     - Separate properties, not in an array initially")
        print("")
        print("  3. JavaScript Objects: properties")
        print("     - point.latitude and point.longitude")
        print("     - onePoint.latitude and onePoint.longitude")
        print("")
        print("  4. JavaScript Arrays: [longitude, latitude]")
        print("     - Used for map display: [lng, lat]")
        print("     - target: [onePoint.longitude, onePoint.latitude]")
        print("     - appConfig.mapView.center=[LONGITUDE, LATITUDE]")

        print("\nIn Database:")
        print("  Format: 'longitude,latitude' with commas replacing decimal points")
        print("  Example: '0,8661099999999999,46,564719999999994'")
        print("  - Commas replace decimal points in numbers")
        print("  - Longitude comes first")
        print("  - Comma separates longitude from latitude")

        print("\nConversion Process:")
        print("  1. Extract from HTML: N 46 33 52.992 E 0 51 57.996")
        print("  2. Convert to decimal: lat=46.5647200, lng=0.8661100")
        print("  3. Format for DB: lng.replace('.', ',') + ',' + lat.replace('.', ',')")
        print("  4. Result: '0,8661100,46,5647200'")

    except Exception as e:
        print(f"Error: {e}")

    finally:
        if driver:
            driver.quit()

if __name__ == "__main__":
    detailed_coordinate_analysis("230")
