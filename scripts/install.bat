@echo off
REM Installation script for UNESCO Heritage Database Validator (Windows)

echo Installing Python dependencies...
pip install -r requirements.txt

echo.
echo Installation complete!
echo.
echo You can now run the validator:
echo   python validate_heritage_database.py --help
echo.
pause
