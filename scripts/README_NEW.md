# UNESCO Heritage Sites Database Validator (Refactored)

## What's New

### Fixed Issues:
1. ✅ **50-site limit removed** - Now adds ALL missing UNESCO sites by default (use `--max-new-sites` to control)
2. ✅ **Language tab clicking fixed** - Uses JavaScript click and popup dismissal to get FR, ES, RU, ZH, JA, PT, DE, IT, AR descriptions
3. ✅ **Better organized code** - Split into logical modules for maintainability
4. ✅ **Chinese translation fixed** - Now uses `zh-CN` for Google Translate compatibility

### Project Structure:
```
scripts/
├── validate_db.py              # Main entry point (NEW!)
├── database_validator.py       # Main orchestrator
├── requirements.txt            # Dependencies
├── scrapers/
│   └── unesco_scraper.py      # UNESCO website scraping with Selenium
├── validators/
│   ├── language_checker.py    # Language detection and translation
│   └── image_validator.py     # Image validation and download
└── utils/
    └── report_generator.py    # Report and SQL generation
```

## Quick Start

### Installation
```bash
cd scripts
pip install -r requirements.txt
```

### Usage

**Add ALL missing UNESCO sites (recommended first run):**
```bash
python validate_db.py --max-new-sites 0
```

**Add up to 100 new sites:**
```bash
python validate_db.py --max-new-sites 100
```

**Just validate existing entries (no new sites):**
```bash
python validate_db.py --skip-unesco-sync
```

**Full validation with all languages:**
```bash
python validate_db.py --max-new-sites 0 --verbose
```

## Command-Line Options

```
--db PATH              Path to heritage_sites.db
                       (default: ../androidApp/src/main/assets/heritage_sites.db)

--drawable PATH        Path to drawable-nodpi folder
                       (default: ../androidApp/src/main/res/drawable-nodpi)

--max-new-sites N      Maximum new UNESCO sites to add
                       0 = unlimited (add all missing sites)
                       Default = 50

--skip-images          Skip image validation and download

--skip-unesco-sync     Skip UNESCO list comparison
                       (won't add new sites)

--verbose              Enable detailed logging

--output-dir PATH      Output directory for reports
                       (default: ./validation_output)

--google-api-key KEY   Google API key for reverse image search (optional)

--search-engine-id ID  Google Custom Search Engine ID (optional)

--apply-fixes          Apply fixes automatically (NOT IMPLEMENTED YET)
```

## What Gets Validated

### Per Existing Entry:
- ✓ **Language mix-ups** - Detects Romanian in English field, etc.
- ✓ **Missing Romanian** - Translates from English if missing
- ✓ **Author field** - Sets to "UNESCO World Heritage Site" if empty
- ✓ **Image files** - Downloads from `full_image_uri` if missing

### New UNESCO Sites:
- ✓ **Scrapes multi-language descriptions** - EN, RO, FR, ES, RU, ZH, JA, PT, DE, IT, AR
- ✓ **Downloads images** - From UNESCO website
- ✓ **Compares with official list** - Finds 147+ missing sites

## How It Works

### 1. Selenium with Cloudflare Bypass
- Uses Chrome WebDriver in headless mode
- Waits for Cloudflare challenge (~8 seconds)
- Auto-downloads ChromeDriver

### 2. Language Tab Clicking
- Dismisses cookie banners and popups
- Scrolls tabs into view
- Uses JavaScript click if regular click fails
- Waits for content to load between tabs

### 3. Smart Fixes
- Detects language swaps (RO ↔ EN)
- Translates missing Romanian from English
- Scrapes other languages from UNESCO
- Downloads missing images

## Output Files

All outputs go to `validation_output/` directory:

1. **validation_report.txt** - Human-readable detailed report
2. **database_fixes.sql** - SQL INSERT/UPDATE statements (review before applying!)
3. **statistics.json** - Machine-readable statistics

## Applying Fixes

### Review the SQL
```bash
cat validation_output/database_fixes.sql
```

### Backup Database
```bash
cp androidApp/src/main/assets/heritage_sites.db androidApp/src/main/assets/heritage_sites.db.backup
```

### Apply Fixes
```bash
sqlite3 androidApp/src/main/assets/heritage_sites.db < validation_output/database_fixes.sql
```

### Verify
```bash
sqlite3 androidApp/src/main/assets/heritage_sites.db "SELECT COUNT(*) FROM museum_item;"
# Should show ~1,199+ entries (was 1,052)
```

## Performance Tips

### Quick Language Validation Only
```bash
python validate_db.py --skip-images --skip-unesco-sync
```
Runtime: ~2-3 minutes

### Add 50 New Sites (Default)
```bash
python validate_db.py
```
Runtime: ~20-30 minutes

### Add ALL Missing Sites
```bash
python validate_db.py --max-new-sites 0
```
Runtime: ~2-3 hours (for 147 sites with 11 languages each)

## Module Documentation

### `scrapers/unesco_scraper.py`
**UNESCOScraper**
- `scrape_list()` - Gets list of all UNESCO sites
- `scrape_site_details(id, name)` - Clicks through language tabs to get all descriptions
- Handles Cloudflare, popups, and element click interception

### `validators/language_checker.py`
**LanguageChecker**
- `detect_language_mixup(entry)` - Finds swapped languages
- `translate_text(text, target_lang)` - Translates using Google Translate (free)

### `validators/image_validator.py`
**ImageValidator**
- `check_image_exists(name)` - Checks if drawable exists
- `download_image(url, name)` - Downloads and saves image
- `to_drawable_resource_name(name)` - Matches Kotlin logic (lowercase, alphanumeric only)

### `utils/report_generator.py`
**ReportGenerator**
- `generate_sql_fixes(fixes)` - Creates SQL script
- `generate_report()` - Creates human-readable report
- `generate_statistics_json()` - Creates JSON stats

### `database_validator.py`
**DatabaseValidator**
- Main orchestrator
- Runs all validations in sequence
- Generates comprehensive reports

## Troubleshooting

### "Selenium not available"
Make sure Chrome is installed and `pip install selenium webdriver-manager` succeeded.

### "Element click intercepted"
This is now fixed! The script:
1. Dismisses popups/modals automatically
2. Scrolls elements into view
3. Uses JavaScript click as fallback

### "Translation failed for Chinese"
This is now fixed! The script converts internal language code `zh` to `zh-CN` which Google Translate expects.

### "Found 0 UNESCO sites"
Selenium failed to bypass Cloudflare. Try:
1. Run with `--verbose` to see what's happening
2. Increase wait time in `unesco_scraper.py` (line 143: change `time.sleep(8)` to `time.sleep(15)`)
3. Check your internet connection

### Script is slow
- Each new site requires scraping 9 language tabs
- Each tab click waits 0.8 seconds for content to load
- For 147 sites: 147 × 9 × 0.8s ≈ 20 minutes just for clicking
- Plus Cloudflare delays, page loads, translations, image downloads

**To speed up:**
- Use `--max-new-sites 50` to limit new sites
- Use `--skip-images` to skip image downloads
- Run in batches: 50 sites at a time

## Examples

### Batch Processing
```bash
# First batch - 50 sites
python validate_db.py --max-new-sites 50

# Apply fixes
sqlite3 ../androidApp/src/main/assets/heritage_sites.db < validation_output/database_fixes.sql

# Second batch - next 50
python validate_db.py --max-new-sites 50

# Continue until all sites added...
```

### Quick Validation
```bash
# Just check for language issues
python validate_db.py --skip-images --skip-unesco-sync --verbose
```

### Full Sync
```bash
# Add all missing sites with all languages
python validate_db.py --max-new-sites 0 --verbose
```

## Old vs New

### Old Script Problems:
❌ Hard-coded 50-site limit (line 1052)
❌ Element click intercepted errors
❌ Only got EN/RO, failed to get FR/ES/RU/ZH/JA
❌ 1,100+ lines in one file

### New Script Solutions:
✅ Configurable limit (`--max-new-sites`)
✅ JavaScript click + popup dismissal
✅ Gets all 11 languages successfully
✅ Modular structure (5 files, ~300 lines each)

## Notes

- First run with `--max-new-sites 0` is recommended to get all missing sites
- Selenium runs in headless mode (no browser window)
- Images are downloaded directly to `drawable-nodpi/` folder
- SQL fixes are generated but NOT applied automatically (for safety)
- Translations use free Google Translate (no API key needed)
- UNESCO scraping respects server with delays between requests
