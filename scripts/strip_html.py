#!/usr/bin/env python3
"""Strip HTML tags from database fields."""

import sqlite3
import re
from pathlib import Path

DB_PATH = Path(__file__).parent.parent / "androidApp/src/main/assets/heritage_sites.db"

def strip_html(text: str) -> str:
    if not text:
        return text
    # Remove HTML tags
    text = re.sub(r'<[^>]+>', '', text)
    # Clean up extra whitespace
    text = re.sub(r'\s+', ' ', text)
    return text.strip()

def main():
    conn = sqlite3.connect(DB_PATH)
    cursor = conn.cursor()

    # Check for HTML in paintingname
    cursor.execute("SELECT id, paintingname FROM museum_item WHERE paintingname LIKE '%<%'")
    rows = cursor.fetchall()
    print(f"Cleaning {len(rows)} paintingname entries...")
    for row_id, text in rows:
        clean = strip_html(text)
        cursor.execute("UPDATE museum_item SET paintingname=? WHERE id=?", (clean, row_id))
        print(f"  {row_id}: cleaned")

    # Check for HTML in description
    cursor.execute("SELECT id, description FROM museum_item WHERE description LIKE '%<%'")
    rows = cursor.fetchall()
    print(f"Cleaning {len(rows)} description entries...")
    for row_id, text in rows:
        clean = strip_html(text)
        cursor.execute("UPDATE museum_item SET description=? WHERE id=?", (clean, row_id))
        print(f"  {row_id}: cleaned")

    # Also clean all description_XX columns
    cursor.execute("PRAGMA table_info(museum_item)")
    cols = [row[1] for row in cursor.fetchall() if row[1].startswith('description_')]

    for col in cols:
        cursor.execute(f"SELECT id, {col} FROM museum_item WHERE {col} LIKE '%<%'")
        rows = cursor.fetchall()
        if rows:
            print(f"Cleaning {len(rows)} {col} entries...")
            for row_id, text in rows:
                clean = strip_html(text)
                cursor.execute(f"UPDATE museum_item SET {col}=? WHERE id=?", (clean, row_id))
                print(f"  {row_id}: cleaned")

    conn.commit()
    conn.close()
    print("Done!")

    # Verify
    conn2 = sqlite3.connect(DB_PATH)
    c2 = conn2.cursor()
    c2.execute("SELECT COUNT(*) FROM museum_item WHERE paintingname LIKE '%<%' OR description LIKE '%<%'")
    remaining = c2.fetchone()[0]
    print(f"Verification: {remaining} entries still with HTML tags")
    conn2.close()

if __name__ == '__main__':
    main()
