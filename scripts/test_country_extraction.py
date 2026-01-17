#!/usr/bin/env python3
"""Test country extraction from site names"""

import re

def extract_country_from_name(site_name: str):
    """Extract country from site name"""
    # Pattern 1: Text in parentheses at the end
    match = re.search(r'\(([^)]+)\)$', site_name.strip())
    if match:
        country = match.group(1)
        if not re.match(r'^\d{4}', country):
            return country

    # Pattern 2: Multiple countries in parentheses throughout
    matches = re.findall(r'\(([A-Z][^)]+?)\)', site_name)
    if matches:
        countries = [m for m in matches if not re.match(r'^\d{4}', m)]
        if countries:
            return ','.join(countries)

    return None

# Test cases
test_sites = [
    "Jesuit Missions of the Guaranis: San Ignacio Mini, Santa Ana, Nuestra Señora de Loreto and Santa Maria Mayor (Argentina), Ruins of Sao Miguel das Missoes (Brazil)",
    "Cueva de las Manos, Río Pinturas",
    "Península Valdés",
    "Mbanza Kongo, Vestiges of the Capital of the former Kingdom of Kongo",
    "Ancient and Primeval Beech Forests of the Carpathians and Other Regions of Europe"
]

for site in test_sites:
    country = extract_country_from_name(site)
    print(f"{site[:60]:60} -> {country}")
