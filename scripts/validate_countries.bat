@echo off
REM Validation script to ensure all countries in museum_item have entries in authors table

set DB_PATH=..\androidApp\src\main\assets\heritage_sites.db

if not exist "%DB_PATH%" (
    echo Error: Database not found at %DB_PATH%
    exit /b 1
)

echo ===================================
echo Country/Author Validation Script
echo ===================================
echo.

echo Extracting and validating countries...
echo.

REM Use PowerShell for better text processing
powershell -Command "& {^
    $dbPath = '%DB_PATH%';^
    $countries = sqlite3 $dbPath 'SELECT DISTINCT trim(value) FROM museum_item, json_each(''[\"'' || replace(author, '','', ''\",''\") || ''\"]'') WHERE author IS NOT NULL AND author != '''' ORDER BY 1' | Where-Object { $_ };^
    $authors = sqlite3 $dbPath 'SELECT DISTINCT name FROM authors WHERE name IS NOT NULL AND name != '''' ORDER BY name' | Where-Object { $_ };^
    $missing = @();^
    foreach ($country in $countries) {^
        if ($authors -notcontains $country) {^
            $missing += $country;^
            Write-Host \"MISSING: '$country'\" -ForegroundColor Red;^
        }^
    };^
    Write-Host \"\";^
    if ($missing.Count -eq 0) {^
        Write-Host '✓ SUCCESS: All countries in museum_item have entries in authors table' -ForegroundColor Green;^
    } else {^
        Write-Host \"✗ FAILURE: $($missing.Count) countries are missing from authors table\" -ForegroundColor Red;^
        exit 1;^
    };^
    Write-Host \"\";^
    Write-Host 'Statistics:';^
    Write-Host '===========';^
    Write-Host \"Unique countries in museum_item: $($countries.Count)\";^
    Write-Host \"Total entries in authors table: $($authors.Count)\";^
}"

if %ERRORLEVEL% neq 0 exit /b %ERRORLEVEL%

echo.
echo Checking for potential data issues...
echo =====================================
echo.

sqlite3 "%DB_PATH%" "SELECT COUNT(*) FROM museum_item WHERE author LIKE '%%,  %%' OR author LIKE '%%  ,%%';" > temp_count.txt
set /p DOUBLE_SPACE_COUNT=<temp_count.txt
del temp_count.txt

if %DOUBLE_SPACE_COUNT% gtr 0 (
    echo ⚠ WARNING: Found %DOUBLE_SPACE_COUNT% entries with extra spaces after commas
)

sqlite3 "%DB_PATH%" "SELECT COUNT(*) FROM museum_item WHERE author IS NULL OR author = '';" > temp_count.txt
set /p EMPTY_AUTHORS=<temp_count.txt
del temp_count.txt

if %EMPTY_AUTHORS% gtr 0 (
    echo ⚠ WARNING: Found %EMPTY_AUTHORS% entries with empty author/country field
)

echo.
echo Validation complete!
