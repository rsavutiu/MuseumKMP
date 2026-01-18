#!/usr/bin/env python3
"""
Remove UNESCO URLs from Database

Removes low-quality UNESCO image URLs from the database while preserving
high-quality URLs from other sources (Wikimedia, Flickr, etc.)
"""

import sqlite3
import sys
from pathlib import Path


def remove_unesco_urls(db_path: str, dry_run: bool = False):
    """
    Remove UNESCO URLs from full_image_uri field.

    Args:
        db_path: Path to heritage_sites.db
        dry_run: If True, only show what would be changed
    """
    conn = sqlite3.connect(db_path)
    cursor = conn.cursor()

    # Find all entries with UNESCO URLs
    cursor.execute("""
        SELECT id, paintingname, full_image_uri
        FROM museum_item
        WHERE full_image_uri LIKE '%unesco.org%'
    """)

    entries = cursor.fetchall()
    print(f"Found {len(entries)} entries with UNESCO URLs")

    modified_count = 0
    nullified_count = 0

    for entry_id, site_name, full_image_uri in entries:
        if not full_image_uri:
            continue

        # Split comma-separated URLs
        urls = [url.strip() for url in full_image_uri.split(',')]

        # Filter out UNESCO URLs
        filtered_urls = [url for url in urls if 'unesco.org' not in url.lower()]

        # Determine new value
        if filtered_urls:
            new_value = ', '.join(filtered_urls)
            action = "FILTERED"
        else:
            new_value = None
            action = "NULLIFIED"
            nullified_count += 1

        # Show what will be changed
        if dry_run:
            print(f"\n[{entry_id}] {site_name}")
            print(f"  OLD: {full_image_uri[:100]}...")
            print(f"  NEW: {new_value[:100] if new_value else 'NULL'}...")
            print(f"  ACTION: {action}")
        else:
            # Update database
            if new_value:
                cursor.execute("""
                    UPDATE museum_item
                    SET full_image_uri = ?
                    WHERE id = ?
                """, (new_value, entry_id))
            else:
                cursor.execute("""
                    UPDATE museum_item
                    SET full_image_uri = NULL
                    WHERE id = ?
                """, (entry_id,))

            modified_count += 1

    if not dry_run:
        conn.commit()
        print(f"\n[OK] Successfully modified {modified_count} entries")
        print(f"  - {modified_count - nullified_count} entries had URLs filtered")
        print(f"  - {nullified_count} entries had all URLs removed (set to NULL)")
    else:
        print(f"\nDRY RUN: Would modify {len(entries)} entries")

    # Verify cleanup
    cursor.execute("""
        SELECT COUNT(*) FROM museum_item
        WHERE full_image_uri LIKE '%unesco.org%'
    """)
    remaining = cursor.fetchone()[0]

    if remaining == 0:
        print(f"[OK] All UNESCO URLs successfully removed")
    else:
        print(f"[WARNING] {remaining} entries still contain UNESCO URLs")

    conn.close()


if __name__ == "__main__":
    # Default paths
    db_path = Path(__file__).parent.parent / "androidApp" / "src" / "main" / "assets" / "heritage_sites.db"

    # Check if --dry-run flag is passed
    dry_run = "--dry-run" in sys.argv

    if not db_path.exists():
        print(f"Error: Database not found at {db_path}")
        sys.exit(1)

    print(f"Database: {db_path}")
    print(f"Mode: {'DRY RUN' if dry_run else 'LIVE'}\n")

    if not dry_run:
        response = input("This will modify the database. Continue? (y/N): ")
        if response.lower() != 'y':
            print("Aborted")
            sys.exit(0)

    remove_unesco_urls(str(db_path), dry_run=dry_run)
