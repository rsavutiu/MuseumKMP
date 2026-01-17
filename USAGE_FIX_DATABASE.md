# Database Fix Script Usage

## Overview

The `scripts/fix_database.py` script is a comprehensive tool that fixes all database issues in one pass:

1. **Author field** - Extracts and sets country/countries for each heritage site
2. **Description translations** - Adds translations for 9 languages (FR, ES, DE, IT, PT, RU, AR, ZH, JA)
3. **Style translations** - Translates the author/country field into all 9 languages
4. **Location coordinates** - Extracts longitude,latitude (with commas instead of decimal points)

## Quick Start

### Test Mode (Process One Entry)
```bash
python scripts/fix_database.py --test-one
```

### Process All Entries
```bash
python scripts/fix_database.py
```

### Custom Database Path
```bash
python scripts/fix_database.py --db path/to/database.db
```

## What It Does

### 1. Author Field (Country Extraction)
The script extracts country names using multiple methods:
- Manual mapping for known difficult sites
- Extracting from site names (text in parentheses)
- Scraping from UNESCO web pages

**Example:**
```
Site: "Ancient and Primeval Beech Forests..."
Author: "Albania,Austria,Belgium,Bulgaria,Croatia,Germany,Italy,Romania,Slovakia,Slovenia,Spain,Ukraine"
```

### 2. Description Translations
Fetches translations from UNESCO's multilingual pages or uses Google Translate API as fallback.

**Languages supported:**
- French (fr)
- Spanish (es)
- German (de)
- Italian (it)
- Portuguese (pt)
- Russian (ru)
- Arabic (ar)
- Chinese/Simplified (zh)
- Japanese (ja)

### 3. Style Translations
Translates the country names (author field) into all supported languages.

**Example:**
```
author: "Albania,Austria,Belgium"
style_fr: "Albanie, Autriche, Belgique"
style_es: "Albania, Austria, Bélgica"
style_de: "Albanien, Österreich, Belgien"
...
```

### 4. Location Coordinates
Extracts coordinates from UNESCO pages in the database format: `longitude,latitude` with commas.

**Example:**
```
Location: "67,82525,34,84694"  (means longitude 67.82525, latitude 34.84694)
```

## Database Format

The script expects and updates these fields in the `museum_item` table:

- `author` - Country/countries (comma-separated)
- `location` - Longitude,latitude (commas instead of decimals)
- `description_XX` - Description in language XX
- `style_XX` - Country name(s) translated to language XX

## Manual Country Mapping

For sites where automatic extraction fails, add them to `MANUAL_COUNTRY_MAP` in the script:

```python
MANUAL_COUNTRY_MAP = {
    'ancient and primeval beech forests': 'Albania,Austria,Belgium,...',
    'mbanza kongo': 'Angola',
    # Add more as needed
}
```

## Features

- **One-pass processing** - All fixes in a single run
- **Smart caching** - Reuses fetched data within a session
- **Rate limiting** - Respects UNESCO and translation API limits
- **Detailed logging** - See exactly what's being fixed
- **Database verification** - Confirms data was written correctly
- **NULL ID handling** - Works with rows that have NULL IDs

## Requirements

Install dependencies:
```bash
pip install selenium webdriver-manager deep-translator requests beautifulsoup4
```

## Tips

1. **Start with test mode** to see how it works on one entry
2. **Check the logs** to understand what's happening
3. **Monitor progress** - The script shows detailed progress for each site
4. **Add manual mappings** when automatic country extraction fails

## Output Example

```
[1/150] Site Name
  UNESCO ID: 1234
  ✓ Country: France
  ✓ FR: 573 chars - 'Ce bien transnational...'
  ✓ ES: 542 chars - 'Este sitio transnacional...'
  ...
  Writing 9 translations to DB
  ✓ Committed and verified 9/9 translations
  Translating style (country) field...
    ✓ style_fr: France
    ✓ style_es: Francia
  ...
  Writing 9 style translations to DB
  Extracting coordinates...
    ✓ Location: 2,35
```

## Previous Scripts

This script consolidates and replaces:
- `fix_database_issues.py` ❌ (deleted)
- `fix_database_quick.py` ❌ (deleted)

All functionality is now in the single `fix_database.py` script.
