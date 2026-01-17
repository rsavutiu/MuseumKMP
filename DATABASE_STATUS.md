# Museum Heritage Database Status

## Current Database State

**Total entries:** 1,202 heritage sites

### Issues to Fix

| Issue | Count | Status |
|-------|-------|--------|
| Missing/incorrect author (country) | 118 | ⚠️ Needs fixing |
| Missing description translations | 0 | ✅ Complete |
| Missing style translations | 148 | ⚠️ Needs fixing |
| Missing location coordinates | 150 | ⚠️ Needs fixing |

## Fix Script

Use the consolidated `scripts/fix_database.py` to fix all issues:

```bash
# Test on one entry first
python scripts/fix_database.py --test-one

# Then process all entries
python scripts/fix_database.py
```

## What Will Be Fixed

### 1. Author Field (118 entries)
Sites with missing or generic "UNESCO World Heritage Site" will get proper country names.

**Example:**
```
Before: author = "UNESCO World Heritage Site"
After:  author = "Albania,Austria,Belgium,Bulgaria,..."
```

### 2. Style Translations (148 entries)
The author/country field will be translated into 9 languages.

**Example:**
```
author = "France"
style_fr = "France"
style_es = "Francia"
style_de = "Frankreich"
style_it = "Francia"
style_pt = "França"
style_ru = "Франция"
style_ar = "فرنسا"
style_zh = "法国"
style_ja = "フランス"
```

### 3. Location Coordinates (150 entries)
Coordinates will be extracted from UNESCO pages in the format: `longitude,latitude` (with commas instead of decimal points).

**Example:**
```
Before: location = NULL
After:  location = "67,82525,34,84694"
```

## Database Schema

The script works with the `museum_item` table which has these relevant columns:

- `id` - Entry ID (may be NULL for some rows)
- `paintingname` - Heritage site name
- `author` - Country/countries (comma-separated)
- `location` - Longitude,latitude with commas
- `description` - English description
- `description_XX` - Description in language XX (fr, es, de, it, pt, ru, ar, zh, ja)
- `style` - Always "UNESCO World Heritage Site"
- `style_XX` - Country name(s) translated to language XX

## Location Format

The database uses a special coordinate format:
- **Format:** `longitude,latitude`
- **Decimal separator:** Comma (`,`) instead of period (`.`)

**Examples:**
- `67,82525,34,84694` → Longitude: 67.82525°, Latitude: 34.84694°
- `4,78684,35,81844` → Longitude: 4.78684°, Latitude: 35.81844°
- `2,383333333,36,55` → Longitude: 2.383333333°, Latitude: 36.55°

## Supported Languages

All 9 UNESCO languages are supported:

| Code | Language |
|------|----------|
| fr | French |
| es | Spanish |
| de | German |
| it | Italian |
| pt | Portuguese |
| ru | Russian |
| ar | Arabic |
| zh | Chinese (Simplified) |
| ja | Japanese |

## See Also

- `USAGE_FIX_DATABASE.md` - Detailed usage instructions
- `scripts/fix_database.py` - The fix script
- `scripts/validate_heritage_database.py` - Validation script
