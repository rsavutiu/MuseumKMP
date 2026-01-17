"""
Test script to fetch UNESCO maps page and find coordinate formats
"""
import re
import requests
from bs4 import BeautifulSoup

def fetch_and_analyze_coordinates(unesco_id: str = "230"):
    """Fetch UNESCO maps page and analyze coordinate formats"""

    print(f"\n{'='*80}")
    print(f"Analyzing UNESCO Site {unesco_id} - Maps Page")
    print(f"{'='*80}\n")

    # Try maps page
    maps_url = f"https://whc.unesco.org/en/list/{unesco_id}/maps/"
    main_url = f"https://whc.unesco.org/en/list/{unesco_id}/"

    headers = {
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36',
        'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    }

    for url_type, url in [("MAPS PAGE", maps_url), ("MAIN PAGE", main_url)]:
        print(f"\n{'-'*80}")
        print(f"Fetching {url_type}: {url}")
        print(f"{'-'*80}")

        try:
            response = requests.get(url, headers=headers, timeout=15)
            print(f"Status Code: {response.status_code}")

            if response.status_code == 200:
                html = response.text

                # 1. Look for JavaScript variables with lat/lng/latitude/longitude
                print("\n### 1. JAVASCRIPT VARIABLES WITH COORDINATES ###")
                js_patterns = [
                    (r'var\s+(\w*[Ll]at\w*)\s*=\s*([+-]?\d+\.?\d*)', "var lat/latitude"),
                    (r'var\s+(\w*[Ll]ng\w*|[Ll]on\w*)\s*=\s*([+-]?\d+\.?\d*)', "var lng/lon/longitude"),
                    (r'(?:lat|latitude)["\']?\s*[:=]\s*([+-]?\d+\.?\d*)', "lat/latitude property"),
                    (r'(?:lng|lon|longitude)["\']?\s*[:=]\s*([+-]?\d+\.?\d*)', "lng/lon/longitude property"),
                ]

                for pattern, desc in js_patterns:
                    matches = re.findall(pattern, html, re.IGNORECASE)
                    if matches:
                        print(f"  {desc}:")
                        for match in matches[:5]:  # Show first 5
                            print(f"    {match}")

                # 2. Look for center coordinates
                print("\n### 2. MAP CENTER COORDINATES ###")
                center_patterns = [
                    (r'center["\']?\s*[:=]\s*\[([+-]?\d+\.?\d*)\s*,\s*([+-]?\d+\.?\d*)\]', "center: [lng, lat]"),
                    (r'center["\']?\s*[:=]\s*\{[^}]*lat["\']?\s*[:=]\s*([+-]?\d+\.?\d*)[^}]*lng["\']?\s*[:=]\s*([+-]?\d+\.?\d*)', "center: {lat, lng}"),
                    (r'setView\(\[([+-]?\d+\.?\d*)\s*,\s*([+-]?\d+\.?\d*)\]', "setView([lat, lng])"),
                ]

                for pattern, desc in center_patterns:
                    matches = re.findall(pattern, html, re.IGNORECASE)
                    if matches:
                        print(f"  {desc}:")
                        for match in matches[:3]:
                            print(f"    {match}")

                # 3. Look for DMS format (Degrees Minutes Seconds)
                print("\n### 3. DMS FORMAT (Degrees Minutes Seconds) ###")
                dms_pattern = r'([NS])\s*(\d+)\s+(\d+)\s+([\d\.]+)\s+([EW])\s*(\d+)\s+(\d+)\s+([\d\.]+)'
                dms_matches = re.findall(dms_pattern, html)
                if dms_matches:
                    print(f"  Found {len(dms_matches)} DMS coordinate sets:")
                    for match in dms_matches[:3]:
                        print(f"    {match}")

                # 4. Look for JSON objects with coordinates
                print("\n### 4. JSON/OBJECT PATTERNS ###")
                json_patterns = [
                    (r'\{[^}]*"lat"["\']?\s*[:=]\s*([+-]?\d+\.?\d*)[^}]*"lng"["\']?\s*[:=]\s*([+-]?\d+\.?\d*)[^}]*\}', 'JSON: {"lat": ..., "lng": ...}'),
                    (r'\[([+-]?\d+\.?\d*)\s*,\s*([+-]?\d+\.?\d*)\]', 'Array: [num, num]'),
                ]

                for pattern, desc in json_patterns:
                    matches = re.findall(pattern, html, re.IGNORECASE)
                    if matches:
                        print(f"  {desc}:")
                        for match in matches[:5]:
                            print(f"    {match}")

                # 5. Extract relevant JavaScript sections
                print("\n### 5. JAVASCRIPT SECTIONS WITH 'MAP' ###")
                script_tags = BeautifulSoup(html, 'html.parser').find_all('script')
                for i, script in enumerate(script_tags):
                    content = script.string
                    if content and ('map' in content.lower() or 'lat' in content.lower() or 'center' in content.lower()):
                        # Show first few lines
                        lines = content.strip().split('\n')[:10]
                        if any('lat' in line.lower() or 'lng' in line.lower() or 'lon' in line.lower() for line in lines):
                            print(f"\n  Script block #{i+1} (first 10 lines):")
                            for line in lines:
                                if 'lat' in line.lower() or 'lng' in line.lower() or 'center' in line.lower() or 'map' in line.lower():
                                    print(f"    {line.strip()[:120]}")

                # 6. Look for specific coordinate values in text
                print("\n### 6. DECIMAL COORDINATE PAIRS ###")
                # Look for reasonable coordinate values (-90 to 90 for lat, -180 to 180 for lng)
                coord_pattern = r'([+-]?\d{1,3}\.\d{3,})[,\s]+([+-]?\d{1,3}\.\d{3,})'
                coord_matches = re.findall(coord_pattern, html)
                if coord_matches:
                    print(f"  Found {len(coord_matches)} potential coordinate pairs:")
                    for val1, val2 in coord_matches[:10]:
                        v1, v2 = float(val1), float(val2)
                        # Check if could be valid coordinates
                        if (-90 <= v1 <= 90 and -180 <= v2 <= 180) or (-90 <= v2 <= 90 and -180 <= v1 <= 180):
                            print(f"    {val1}, {val2}")

        except Exception as e:
            print(f"Error: {e}")

    print(f"\n{'='*80}\n")

if __name__ == "__main__":
    # Test with site 230 (as requested)
    fetch_and_analyze_coordinates("230")
