import re
import time
import requests
import logging
from typing import Optional
from database_fix.WHS_Models import MANUAL_COUNTRY_MAP

logger = logging.getLogger(__name__)

class SmartCountryExtractor:
    """Extracts country from site names and UNESCO pages."""

    def extract_from_name(self, site_name: str) -> Optional[str]:
        matches = re.findall(r'\(([A-Z][a-z]+(?:\s+[a-zA-Z]+)*)\)', site_name)
        if matches:
            countries = [m for m in matches if not re.search(r'\d{4}|[\d\.]+', m)
                         and m.lower() not in ['unesco', 'cultural', 'natural', 'mixed']]
            return ','.join(countries) if countries else None
        return None

    def lookup_manual(self, site_name: str) -> Optional[str]:
        name_lower = site_name.lower()
        for key, country in MANUAL_COUNTRY_MAP.items():
            if key in name_lower:
                return country
        return None

    def search_unesco_directly(self, unesco_id: str) -> Optional[str]:
        try:
            url = f"https://whc.unesco.org/en/list/{unesco_id}"
            response = requests.get(url, headers={'User-Agent': 'Mozilla/5.0'}, timeout=10)
            html = response.text
            patterns = [r'States Parties:</strong>\s*([^<]+)', r'Country:</strong>\s*([^<]+)']
            for p in patterns:
                match = re.search(p, html, re.IGNORECASE)
                if match:
                    return match.group(1).replace('&nbsp;', ' ').strip()
        except Exception as e:
            logger.debug(f"UNESCO scrape failed for {unesco_id}: {e}")
        return None

class CoordinateExtractor:
    """Extracts coordinates (longitude,latitude) from UNESCO pages."""

    def parse_dms_to_decimal(self, degrees: float, minutes: float, seconds: float, direction: str) -> float:
        decimal = degrees + (minutes / 60.0) + (seconds / 3600.0)
        return -decimal if direction in ['S', 'W'] else decimal

    def extract_coordinates(self, unesco_id: str) -> Optional[str]:
        try:
            url = f"https://whc.unesco.org/en/list/{unesco_id}/"
            response = requests.get(url, headers={'User-Agent': 'Mozilla/5.0'}, timeout=15)
            if response.status_code == 200:
                html = response.text
                dms_pattern = r'([NS])\s*(\d+)\s+(\d+)\s+([\d\.]+)\s+([EW])\s*(\d+)\s+(\d+)\s+([\d\.]+)'
                match = re.search(dms_pattern, html)
                if match:
                    lat_dir, lat_deg, lat_min, lat_sec, lng_dir, lng_deg, lng_min, lng_sec = match.groups()
                    lat = self.parse_dms_to_decimal(float(lat_deg), float(lat_min), float(lat_sec), lat_dir)
                    lng = self.parse_dms_to_decimal(float(lng_deg), float(lng_min), float(lng_sec), lng_dir)
                    # Longitude first for GIS systems
                    return f"{str(lng).replace('.', ',')},{str(lat).replace('.', ',')}"
        except Exception as e:
            logger.debug(f"Coord extraction failed for {unesco_id}: {e}")
        return None

    def close(self):
        pass