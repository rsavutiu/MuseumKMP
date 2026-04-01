#!/usr/bin/env python3
"""
Fix missing style_XX translations for new languages (hi, hu, pl, tr)
and fill gaps in ro and zh.
"""

import sqlite3
import time
from deep_translator import GoogleTranslator
from pathlib import Path

DB_PATH = Path(__file__).parent.parent / "androidApp/src/main/assets/heritage_sites.db"

LANG_MAP = {
    'hi': 'hi',
    'hu': 'hu',
    'pl': 'pl',
    'tr': 'tr',
    'ro': 'ro',
    'zh': 'zh-CN',
}

def translate(text: str, lang_code: str) -> str:
    try:
        return GoogleTranslator(source='en', target=lang_code).translate(text)
    except Exception as e:
        print(f"  ERROR translating to {lang_code}".encode('ascii', errors='replace').decode())
        return ''

def main():
    conn = sqlite3.connect(DB_PATH)
    cursor = conn.cursor()

    # Columns to fix and their target language codes
    targets = [
        ('style_hi', 'hi'),
        ('style_hu', 'hu'),
        ('style_pl', 'pl'),
        ('style_tr', 'tr'),
        ('style_ro', 'ro'),
        ('style_zh', 'zh'),
    ]

    # Find which columns actually have missing data
    missing = {}
    for col, lang in targets:
        cursor.execute(f"SELECT COUNT(*) FROM museum_item WHERE {col} IS NULL OR {col}=''")
        count = cursor.fetchone()[0]
        if count > 0:
            missing[col] = (lang, count)
            print(f"  {col}: {count} missing")

    if not missing:
        print("Nothing to fix!")
        return

    # Get all unique authors that need any of the missing columns filled
    where_parts = [f"({col} IS NULL OR {col}='')" for col in missing]
    cursor.execute(
        f"SELECT DISTINCT author FROM museum_item WHERE {' OR '.join(where_parts)}"
    )
    unique_authors = [r[0] for r in cursor.fetchall() if r[0]]
    print(f"\nTranslating {len(unique_authors)} unique author values into {len(missing)} languages...")

    # Build translation cache: author -> {col: translated}
    cache = {}
    for i, author in enumerate(unique_authors):
        cache[author] = {}
        for col, (lang, _) in missing.items():
            api_lang = LANG_MAP[lang]
            translated = translate(author, api_lang)
            cache[author][col] = translated
            print(f"  [{i+1}/{len(unique_authors)}] {lang}: done".encode('ascii', errors='replace').decode())
            time.sleep(0.15)

    # Apply updates row by row using the cache
    cursor.execute(
        f"SELECT id, author FROM museum_item WHERE {' OR '.join(where_parts)}"
    )
    rows = cursor.fetchall()
    print(f"\nUpdating {len(rows)} rows...")

    updated = 0
    for row_id, author in rows:
        if not author or author not in cache:
            continue
        set_parts = []
        params = []
        for col in missing:
            val = cache[author].get(col, '')
            if val:
                set_parts.append(f"{col}=?")
                params.append(val)
        if set_parts:
            params.append(row_id)
            cursor.execute(f"UPDATE museum_item SET {', '.join(set_parts)} WHERE id=?", params)
            updated += 1

    conn.commit()
    conn.close()
    print(f"\nDone. Updated {updated} rows.")

    # Verify
    conn2 = sqlite3.connect(DB_PATH)
    c2 = conn2.cursor()
    print("\nVerification:")
    for col, _ in targets:
        c2.execute(f"SELECT COUNT(*) FROM museum_item WHERE {col} IS NULL OR {col}=''")
        remaining = c2.fetchone()[0]
        status = "OK" if remaining == 0 else f"MISSING {remaining}"
        print(f"  {col}: {status}")
    conn2.close()

if __name__ == '__main__':
    main()
