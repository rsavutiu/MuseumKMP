# UNESCO Heritage Sites Database Validator

Comprehensive validation and repair tool for the `heritage_sites.db` SQLite database.

## Features

- **Language Validation**: Auto-detects and fixes language mix-ups across 11 languages
- **Translation**: Auto-translates missing descriptions from English or French
- **Image Validation**: Checks image files exist with correct naming convention
- **Image Download**: Downloads missing images from `full_image_uri` field
- **Reverse Image Search**: Verifies images match heritage sites (requires Google API)
- **UNESCO Sync**: Compares database with official UNESCO list and adds missing sites
- **Detailed Reports**: Generates human-readable reports and SQL fix scripts

## Installation

1. Install Python dependencies:

```bash
cd scripts
pip install -r requirements.txt
```

## Usage

### Basic Validation (Safe - Read-only)

```bash
python validate_heritage_database.py
```

This will:
- Validate all database entries
- Generate reports in `./validation_output/`
- Create `database_fixes.sql` for manual review
- **NOT** modify the database

### With Image Reverse Search

```bash
python validate_heritage_database.py \
  --google-api-key "YOUR_API_KEY" \
  --search-engine-id "YOUR_SEARCH_ENGINE_ID"
```

### Skip Certain Validations

```bash
# Skip image validation
python validate_heritage_database.py --skip-images

# Skip UNESCO sync
python validate_heritage_database.py --skip-unesco-sync

# Skip both
python validate_heritage_database.py --skip-images --skip-unesco-sync
```

### Verbose Output

```bash
python validate_heritage_database.py --verbose
```

### Apply Fixes Automatically (USE WITH CAUTION)

```bash
python validate_heritage_database.py --apply-fixes
```

**WARNING**: This will modify the database directly. Make a backup first!

## Command-Line Options

```
--db PATH              Path to heritage_sites.db (default: auto-detect)
--drawable PATH        Path to drawable-nodpi folder (default: auto-detect)
--google-api-key KEY   Google API key for reverse image search
--search-engine-id ID  Google Custom Search Engine ID
--apply-fixes          Apply fixes automatically (default: generate SQL only)
--skip-images          Skip image validation
--skip-unesco-sync     Skip UNESCO list comparison
--verbose              Detailed logging
--output-dir PATH      Output directory for reports (default: ./validation_output)
```

## Output Files

After running, you'll find these files in the output directory:

1. **validation_report.txt** - Human-readable detailed report
2. **database_fixes.sql** - SQL statements to fix issues (review before applying!)
3. **statistics.json** - Machine-readable statistics
4. **validation_log.txt** - Complete debug log (if using --verbose)

## Applying Fixes

1. **Review the generated SQL**:
```bash
cat validation_output/database_fixes.sql
```

2. **Backup your database**:
```bash
cp androidApp/src/main/assets/heritage_sites.db androidApp/src/main/assets/heritage_sites.db.backup
```

3. **Apply the fixes**:
```bash
sqlite3 androidApp/src/main/assets/heritage_sites.db < validation_output/database_fixes.sql
```

4. **Verify**:
```bash
sqlite3 androidApp/src/main/assets/heritage_sites.db "SELECT COUNT(*) FROM museum_item;"
```

## What Gets Validated

### Per Entry:
- ✓ English description exists and is in English
- ✓ Romanian description exists and is in Romanian
- ✓ Other 9 languages - fetch if missing, translate if needed
- ✓ Author field populated
- ✓ Image file exists with correct naming
- ✓ Image matches site (via reverse search if API keys provided)
- ✓ Language mix-ups detected and swapped

### Global:
- ✓ UNESCO comparison - identify missing sites
- ✓ Add new entries - insert missing sites with full data

## Language Detection

The script auto-detects:
- Romanian text in English fields (and vice versa)
- Missing translations
- Swapped language fields

It will automatically:
- Swap fields if detected
- Translate missing descriptions from English
- Fetch descriptions from UNESCO website when available

## Image Naming Convention

Images must follow this naming convention (matching the Kotlin code):
- Convert site name to lowercase
- Remove all non-alphanumeric characters
- Keep only a-z and 0-9

Example:
- "Aachen Cathedral" → `aachencathedral.jpg`
- "Abbey and Altenmuenster of Lorsch" → `abbeyandaltenmunsteroflorsch.jpg`

## Error Handling

- Network errors: Retries 3 times with exponential backoff
- Translation API limits: Handled gracefully
- Missing UNESCO data: Falls back to empty fields, reports in output
- Database locked: Waits and retries

## Notes

- Script is **read-only by default** - generates SQL for review
- Use `--apply-fixes` flag to automatically apply (use with caution!)
- Google API key required for reverse image search (has quota limits)
- UNESCO scraping may be slow (1,199+ pages to fetch)
- Translation may have rate limits - script handles this gracefully
- Database backup is created automatically before any writes

## Troubleshooting

### "Module not found" errors
Install dependencies: `pip install -r requirements.txt`

### UNESCO scraping fails
The script uses the UNESCO JSON API. If it fails, check your internet connection.

### Translation fails
The script uses `deep-translator` which is free and doesn't require API keys. If it fails, it will be logged and the field will be left empty.

### Image downloads fail
Check the `full_image_uri` field in the database for valid URLs.

## Google Custom Search API Setup (Optional)

For reverse image search functionality:

1. Get a Google Cloud API key: https://console.cloud.google.com/
2. Enable Custom Search API
3. Create a Custom Search Engine: https://cse.google.com/cse/
4. Configure it to search the entire web
5. Get the Search Engine ID
6. Pass both to the script via `--google-api-key` and `--search-engine-id`

Note: This is optional. The script works fine without it, but won't verify image correctness.
