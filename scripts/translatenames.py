import sqlite3
import sys

from deep_translator import GoogleTranslator


def translate_painting_names(db_path, languages):
    """
    Checks for missing translations in a SQLite table and fills them.
    Assumes a table named 'paintings' with a 'paintingname' source column.
    """
    try:
        # Connect to the database
        conn = sqlite3.connect(db_path)
        cursor = conn.cursor()

        # 1. Ensure columns exist for each language
        # SQLite doesn't support 'IF NOT EXISTS' for columns directly in older versions,
        # so we fetch existing columns first.
        cursor.execute("PRAGMA table_info(museum_item)")
        existing_columns = [info[1] for info in cursor.execute("PRAGMA table_info(museum_item)").fetchall()]

        for lang in languages:
            col_name = f"paintingname_{lang}"
            if col_name not in existing_columns:
                print(f"Adding missing column: {col_name}")
                cursor.execute(f"ALTER TABLE museum_item ADD COLUMN {col_name} TEXT")

        # 2. Fetch rows where at least one translation is missing/null
        # We build a query dynamically based on the languages array
        where_clause = " OR ".join([f"paintingname_{lang} IS NULL OR paintingname_{lang} = ''" for lang in languages])
        cursor.execute(f"SELECT id, paintingname FROM museum_item WHERE {where_clause}")
        rows = cursor.fetchall()

        if not rows:
            print("No missing translations found.")
            return

        print(f"Found {len(rows)} rows requiring translation updates...")

        # 3. Process translations
        for row_id, source_text in rows[:150]:
            if not source_text:
                continue

            updates = []
            params = []

            for lang in languages:
                col_name = f"paintingname_{lang}"

                # Check if this specific cell needs translating
                cursor.execute(f"SELECT {col_name} FROM museum_item WHERE id = ?", (row_id,))
                current_val = cursor.fetchone()[0]

                if not current_val:
                    try:
                        if lang == 'zh': lang = 'zh-CN'
                        translated = GoogleTranslator(source='auto', target=lang).translate(source_text)
                        updates.append(f"{col_name} = ?")
                        params.append(translated)
                        print(f"[{lang}] Translated '{source_text}' -> '{translated}'")
                    except Exception as e:
                        print(f"Error translating to {lang}: {e}")

            if updates:
                params.append(row_id)
                query = f"UPDATE museum_item SET {', '.join(updates)} WHERE id = ?"
                cursor.execute(query, tuple(params))
                conn.commit()

        print("Translation process complete.")

    except sqlite3.Error as e:
        print(f"Database error: {e}")
    finally:
        if conn:
            conn.close()


if __name__ == "__main__":
    args = sys.argv
    # CONFIGURATION
    print(args)
    TARGET_LANGUAGES = eval(args.pop())  # Romanian, French, German, Spanish
    print("TARGET_LANGUAGES", TARGET_LANGUAGES)
    DATABASE_FILE = args.pop()
    print("DATABASE_FILE", DATABASE_FILE)

    translate_painting_names(DATABASE_FILE, TARGET_LANGUAGES)