#!/bin/bash

# Validation script to ensure all countries in museum_item have entries in authors table

DB_PATH="../androidApp/src/main/assets/heritage_sites.db"

# Check if database exists
if [ ! -f "$DB_PATH" ]; then
    echo "Error: Database not found at $DB_PATH"
    exit 1
fi

echo "==================================="
echo "Country/Author Validation Script"
echo "==================================="
echo ""

# Get all unique countries from museum_item table (from author field)
echo "Extracting countries from museum_item table..."
sqlite3 "$DB_PATH" > /tmp/museum_countries.txt <<'EOF'
.mode list
.separator ","
SELECT DISTINCT trim(value) as country
FROM museum_item, json_each('["' || replace(author, ',', '","') || '"]')
WHERE author IS NOT NULL AND author != ''
ORDER BY country;
EOF

# Get all country names from authors table
echo "Extracting countries from authors table..."
sqlite3 "$DB_PATH" > /tmp/authors_countries.txt <<'EOF'
.mode list
SELECT DISTINCT name
FROM authors
WHERE name IS NOT NULL AND name != ''
ORDER BY name;
EOF

# Find countries in museum_item but not in authors table
echo ""
echo "Checking for missing countries in authors table..."
echo "=================================================="

MISSING_COUNT=0
while IFS= read -r country; do
    if ! grep -Fxq "$country" /tmp/authors_countries.txt; then
        echo "MISSING: '$country'"
        ((MISSING_COUNT++))
    fi
done < /tmp/museum_countries.txt

echo ""
if [ $MISSING_COUNT -eq 0 ]; then
    echo "✓ SUCCESS: All countries in museum_item have entries in authors table"
else
    echo "✗ FAILURE: $MISSING_COUNT countries are missing from authors table"
    exit 1
fi

# Count statistics
TOTAL_COUNTRIES=$(wc -l < /tmp/museum_countries.txt)
TOTAL_AUTHORS=$(wc -l < /tmp/authors_countries.txt)

echo ""
echo "Statistics:"
echo "==========="
echo "Unique countries in museum_item: $TOTAL_COUNTRIES"
echo "Total entries in authors table: $TOTAL_AUTHORS"

# Check for countries with multiple commas (might indicate data issues)
echo ""
echo "Checking for potential data issues..."
echo "====================================="

sqlite3 "$DB_PATH" <<'EOF'
.mode column
.headers on
SELECT id, paintingname, author
FROM museum_item
WHERE author LIKE '%,  %' OR author LIKE '%  ,%'
LIMIT 10;
EOF

DOUBLE_SPACE_COUNT=$(sqlite3 "$DB_PATH" "SELECT COUNT(*) FROM museum_item WHERE author LIKE '%,  %' OR author LIKE '%  ,%';")
if [ "$DOUBLE_SPACE_COUNT" -gt 0 ]; then
    echo ""
    echo "⚠ WARNING: Found $DOUBLE_SPACE_COUNT entries with extra spaces after commas"
fi

# Check for empty authors
EMPTY_AUTHORS=$(sqlite3 "$DB_PATH" "SELECT COUNT(*) FROM museum_item WHERE author IS NULL OR author = '';")
if [ "$EMPTY_AUTHORS" -gt 0 ]; then
    echo "⚠ WARNING: Found $EMPTY_AUTHORS entries with empty author/country field"
fi

# Cleanup
rm -f /tmp/museum_countries.txt /tmp/authors_countries.txt

echo ""
echo "Validation complete!"
