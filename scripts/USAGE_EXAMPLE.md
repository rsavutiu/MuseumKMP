# Usage Example

## Quick Start

### 1. Install Dependencies

**Windows:**
```bash
install.bat
```

**Linux/Mac:**
```bash
chmod +x install.sh
./install.sh
```

**Or manually:**
```bash
pip install -r requirements.txt
```

### 2. Run Basic Validation

```bash
python validate_heritage_database.py
```

This will:
- Check all 1,052 database entries
- Validate language fields (English, Romanian, and 9 others)
- Check for missing authors
- Validate image files exist
- Compare with UNESCO official list
- Generate reports in `./validation_output/`

### 3. Review the Output

```bash
# View the summary report
cat validation_output/validation_report.txt

# View the SQL fixes (REVIEW BEFORE APPLYING!)
cat validation_output/database_fixes.sql

# View statistics
cat validation_output/statistics.json
```

## Example Output

### Console Output
```
============================================================
UNESCO HERITAGE DATABASE VALIDATOR
============================================================
2026-01-15 10:30:45 - INFO - Connecting to database: androidApp/src/main/assets/heritage_sites.db
2026-01-15 10:30:45 - INFO - Loading database entries...
2026-01-15 10:30:45 - INFO - Loaded 1052 entries
2026-01-15 10:30:45 - INFO - Validating language fields...
2026-01-15 10:30:46 - WARNING -   Language issue in [3] Historic Centres of Berat and Gjirokastra: ro_in_en_field
2026-01-15 10:30:50 - INFO -   Processed 50/1052 entries...
2026-01-15 10:30:55 - INFO -   Processed 100/1052 entries...
...
2026-01-15 10:31:20 - INFO - Language validation complete. Found 15 issues
2026-01-15 10:31:20 - INFO - Validating author fields...
2026-01-15 10:31:21 - INFO - Author validation complete. Found 0 missing authors
2026-01-15 10:31:21 - INFO - Validating images...
2026-01-15 10:31:22 - INFO -   Downloading image for [234] Machu Picchu
2026-01-15 10:31:25 - INFO -   Processed 50/1052 images...
...
2026-01-15 10:32:30 - INFO - Image validation complete. Missing: 8, Downloaded: 8
2026-01-15 10:32:30 - INFO - Syncing with UNESCO list...
2026-01-15 10:32:35 - INFO - Found 147 missing UNESCO sites
2026-01-15 10:32:40 - INFO -   Processing 10/50 new sites...
...
2026-01-15 10:35:20 - INFO - UNESCO sync complete. Added 50 new sites

2026-01-15 10:35:21 - INFO - Generating reports...
2026-01-15 10:35:21 - INFO - ✓ SQL fixes: validation_output/database_fixes.sql
2026-01-15 10:35:21 - INFO - ✓ Report: validation_output/validation_report.txt
2026-01-15 10:35:21 - INFO - ✓ Statistics: validation_output/statistics.json

============================================================
VALIDATION COMPLETE
============================================================
2026-01-15 10:35:21 - INFO - Issues found: 73
2026-01-15 10:35:21 - INFO - Fixes generated: 73
2026-01-15 10:35:21 - INFO - Please review the reports before applying fixes!
```

### validation_report.txt
```
============================================================
UNESCO HERITAGE DATABASE VALIDATION REPORT
============================================================
Generated: 2026-01-15 10:35:21
Database: heritage_sites.db

SUMMARY:
------------------------------------------------------------
✓ Language Issues: 15 found, 15 fixed
✓ Missing Authors: 0 found, 0 fixed
✓ Missing Images: 8 found, 8 downloaded
✓ Incorrect Images: 0 found (flagged for review)
✓ Missing UNESCO Sites: 147 found, 50 added

LANGUAGE ISSUES DETAIL:
------------------------------------------------------------
[ID 3] Historic Centres of Berat and Gjirokastra
  Issue: ro_in_en_field
  Fix: move_and_fetch_en
  Status: FIXED

[ID 127] Monastery of Gelati
  Issue: Missing Romanian description
  Fix: Translated from English
  Status: FIXED

... (13 more)

IMAGE VALIDATION:
------------------------------------------------------------
[ID 234] Machu Picchu
  Issue: missing
  Details: Downloaded from https://upload.wikimedia.org/...
  Status: FIXED

... (7 more)

NEW ENTRIES ADDED:
------------------------------------------------------------
[NEW] Tr'ondëk-Klondike
  Location: Canada
  Year: 2023

[NEW] Gordion
  Location: Türkiye
  Year: 2023

... (48 more)

SQL FIXES GENERATED:
------------------------------------------------------------
File: database_fixes.sql
IMPORTANT: Review SQL carefully before applying!
```

## Common Scenarios

### Scenario 1: Language Mix-ups Only

```bash
python validate_heritage_database.py --skip-images --skip-unesco-sync
```

This will only check language fields and authors, skipping the time-consuming image and UNESCO sync.

### Scenario 2: Images Only

```bash
python validate_heritage_database.py --skip-unesco-sync
```

Validates images but doesn't sync with UNESCO (faster).

### Scenario 3: Full Validation with Verbose Output

```bash
python validate_heritage_database.py --verbose
```

Shows detailed progress and debug information.

### Scenario 4: Custom Paths

```bash
python validate_heritage_database.py \
  --db "path/to/custom/heritage_sites.db" \
  --drawable "path/to/custom/drawable" \
  --output-dir "path/to/custom/output"
```

## Applying the Fixes

### Step 1: Backup Your Database

```bash
cp androidApp/src/main/assets/heritage_sites.db androidApp/src/main/assets/heritage_sites.db.backup
```

### Step 2: Review the SQL

```bash
cat validation_output/database_fixes.sql
```

Look for:
- Language swaps - make sure they look correct
- New entries - verify the data looks reasonable
- Author updates - check they make sense

### Step 3: Apply the Fixes

```bash
sqlite3 androidApp/src/main/assets/heritage_sites.db < validation_output/database_fixes.sql
```

### Step 4: Verify

```bash
# Check entry count increased
sqlite3 androidApp/src/main/assets/heritage_sites.db "SELECT COUNT(*) FROM museum_item;"

# Spot-check a few entries that were fixed
sqlite3 androidApp/src/main/assets/heritage_sites.db "SELECT id, paintingname, substr(description, 1, 100), substr(description_ro, 1, 100) FROM museum_item WHERE id = 3;"
```

### Step 5: Test in App

1. Build and run the Android app
2. Navigate to a few heritage sites that were fixed
3. Switch between English and Romanian
4. Verify descriptions look correct
5. Check images display properly

## Troubleshooting

### Issue: "No module named 'requests'"

**Solution:**
```bash
pip install -r requirements.txt
```

### Issue: "Failed to scrape UNESCO list"

**Possible causes:**
- Internet connection issues
- UNESCO website is down
- Firewall blocking requests

**Solution:**
Try running with `--skip-unesco-sync` to skip this step, or try again later.

### Issue: Image downloads failing

**Possible causes:**
- URLs in `full_image_uri` are broken
- Network issues
- Source websites blocking requests

**Solution:**
Check the validation report for specific errors. You may need to manually download some images.

### Issue: Translation fails

**Note:** The script uses `deep-translator` which is free and doesn't require API keys.

**Possible causes:**
- Network issues
- Rate limiting

**Solution:**
The script will continue and leave translations empty. You can re-run later or manually translate.

## Performance Tips

### For Quick Language Validation
```bash
python validate_heritage_database.py --skip-images --skip-unesco-sync
```
Runtime: ~2-3 minutes

### For Full Validation (First Time)
```bash
python validate_heritage_database.py
```
Runtime: ~30-45 minutes (due to UNESCO scraping and image downloads)

### For Subsequent Runs
After the first full run, subsequent runs are faster since:
- Images are already downloaded
- Translation cache is built up
- UNESCO scraper cache is populated

## Tips

1. **Start with a test run**: Use `--skip-images --skip-unesco-sync` for quick validation
2. **Review before applying**: Always review `database_fixes.sql` before applying
3. **Backup first**: Always backup your database before applying fixes
4. **Incremental approach**: Fix language issues first, then images, then add new sites
5. **Monitor progress**: Use `--verbose` to see detailed progress

## Questions?

See the main [README.md](README.md) for more details.
