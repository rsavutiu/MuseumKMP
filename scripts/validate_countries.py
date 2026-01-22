#!/usr/bin/env python3
"""
Country Validation Script

Extracts all unique countries from museum_item.author field (comma-separated)
and validates them against the authors table.
"""

import sqlite3
import logging
from pathlib import Path
from typing import Set, List, Tuple

logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s'
)
logger = logging.getLogger(__name__)


class CountryValidator:
    """Validates countries from museum_item against authors table"""

    def __init__(self, db_path: str):
        self.db_path = Path(db_path)
        self.conn = None

    def connect(self):
        """Connect to database"""
        logger.info(f"Connecting to {self.db_path}")
        self.conn = sqlite3.connect(self.db_path)
        self.conn.row_factory = sqlite3.Row

    def close(self):
        """Close database connection"""
        if self.conn:
            self.conn.close()
            logger.info("Database connection closed")

    def extract_all_countries(self) -> Tuple[Set[str], dict]:
        """
        Extract all unique countries from museum_item.author field
        Returns: (set of unique countries, dict of country -> count)
        """
        logger.info("Extracting countries from museum_item.author field...")

        cursor = self.conn.cursor()
        cursor.execute("""
            SELECT id, paintingname, author
            FROM museum_item
            WHERE author IS NOT NULL AND author != ''
            ORDER BY id
        """)

        all_countries = set()
        country_counts = {}
        site_countries = []  # List of (site_id, site_name, [countries])

        for row in cursor.fetchall():
            site_id = row['id']
            site_name = row['paintingname']
            author = row['author']

            # Split by comma and clean up
            countries = [c.strip() for c in author.split(',') if c.strip()]

            if countries:
                site_countries.append((site_id, site_name, countries))

                for country in countries:
                    all_countries.add(country)
                    country_counts[country] = country_counts.get(country, 0) + 1

        logger.info(f"Found {len(all_countries)} unique countries from {len(site_countries)} sites")
        return all_countries, country_counts, site_countries

    def get_authors_table_countries(self) -> Set[str]:
        """
        Get all country names from authors table
        Returns: set of country names
        """
        logger.info("Extracting countries from authors table...")

        cursor = self.conn.cursor()
        cursor.execute("SELECT id, name FROM authors WHERE name IS NOT NULL AND name != ''")

        author_names = set()
        for row in cursor.fetchall():
            name = row['name'].strip()
            if name:
                author_names.add(name)

        logger.info(f"Found {len(author_names)} entries in authors table")
        return author_names

    def validate_countries(self):
        """Main validation logic"""
        logger.info("=" * 60)
        logger.info("COUNTRY VALIDATION")
        logger.info("=" * 60)

        # Extract countries from museum_item
        museum_countries, country_counts, site_countries = self.extract_all_countries()

        # Get countries from authors table
        author_countries = self.get_authors_table_countries()

        # Find countries in museum_item but NOT in authors table
        missing_countries = museum_countries - author_countries

        # Find countries that exist in both
        valid_countries = museum_countries & author_countries

        # Generate report
        logger.info("\n" + "=" * 60)
        logger.info("VALIDATION RESULTS")
        logger.info("=" * 60)

        logger.info(f"\nTotal unique countries in museum_item: {len(museum_countries)}")
        logger.info(f"Countries found in authors table: {len(valid_countries)}")
        logger.info(f"Countries MISSING from authors table: {len(missing_countries)}")

        if missing_countries:
            logger.info("\n" + "-" * 60)
            logger.info("COUNTRIES NOT IN AUTHORS TABLE:")
            logger.info("-" * 60)

            # Sort by frequency (most common first)
            sorted_missing = sorted(missing_countries,
                                  key=lambda x: country_counts.get(x, 0),
                                  reverse=True)

            for i, country in enumerate(sorted_missing, 1):
                count = country_counts.get(country, 0)
                logger.info(f"{i:3d}. {country:<50s} (used {count} times)")

        # Show some examples of sites with missing countries
        if missing_countries:
            logger.info("\n" + "-" * 60)
            logger.info("EXAMPLE SITES WITH MISSING COUNTRIES:")
            logger.info("-" * 60)

            examples_shown = 0
            for site_id, site_name, countries in site_countries:
                if examples_shown >= 10:
                    break

                missing_in_site = [c for c in countries if c in missing_countries]
                if missing_in_site:
                    logger.info(f"\n[ID {site_id}] {site_name}")
                    logger.info(f"  Countries: {', '.join(countries)}")
                    logger.info(f"  Missing: {', '.join(missing_in_site)}")
                    examples_shown += 1

        # Export to file
        output_file = Path("validation_output/country_validation.txt")
        output_file.parent.mkdir(exist_ok=True)

        with open(output_file, 'w', encoding='utf-8') as f:
            f.write("COUNTRY VALIDATION REPORT\n")
            f.write("=" * 60 + "\n\n")

            f.write(f"Total unique countries in museum_item: {len(museum_countries)}\n")
            f.write(f"Countries found in authors table: {len(valid_countries)}\n")
            f.write(f"Countries MISSING from authors table: {len(missing_countries)}\n\n")

            f.write("-" * 60 + "\n")
            f.write("ALL COUNTRIES IN MUSEUM_ITEM (sorted by frequency):\n")
            f.write("-" * 60 + "\n")
            sorted_all = sorted(museum_countries,
                              key=lambda x: country_counts.get(x, 0),
                              reverse=True)
            for i, country in enumerate(sorted_all, 1):
                count = country_counts.get(country, 0)
                status = "✓" if country in author_countries else "✗"
                f.write(f"{i:3d}. {status} {country:<50s} (used {count} times)\n")

            if missing_countries:
                f.write("\n" + "-" * 60 + "\n")
                f.write("COUNTRIES NOT IN AUTHORS TABLE:\n")
                f.write("-" * 60 + "\n")

                sorted_missing = sorted(missing_countries,
                                      key=lambda x: country_counts.get(x, 0),
                                      reverse=True)

                for i, country in enumerate(sorted_missing, 1):
                    count = country_counts.get(country, 0)
                    f.write(f"{i:3d}. {country:<50s} (used {count} times)\n")

                f.write("\n" + "-" * 60 + "\n")
                f.write("SITES WITH MISSING COUNTRIES:\n")
                f.write("-" * 60 + "\n")

                for site_id, site_name, countries in site_countries:
                    missing_in_site = [c for c in countries if c in missing_countries]
                    if missing_in_site:
                        f.write(f"\n[ID {site_id}] {site_name}\n")
                        f.write(f"  Countries: {', '.join(countries)}\n")
                        f.write(f"  Missing: {', '.join(missing_in_site)}\n")

        logger.info(f"\n✓ Full report saved to: {output_file}")

        # Also create a simple CSV for easy processing
        csv_file = Path("validation_output/countries_list.csv")
        with open(csv_file, 'w', encoding='utf-8') as f:
            f.write("Country,Count,InAuthorsTable\n")
            sorted_all = sorted(museum_countries,
                              key=lambda x: country_counts.get(x, 0),
                              reverse=True)
            for country in sorted_all:
                count = country_counts.get(country, 0)
                in_authors = "Yes" if country in author_countries else "No"
                # Escape country name if it contains comma
                country_escaped = f'"{country}"' if ',' in country else country
                f.write(f"{country_escaped},{count},{in_authors}\n")

        logger.info(f"✓ CSV export saved to: {csv_file}")

    def run(self):
        """Run validation"""
        try:
            self.connect()
            self.validate_countries()

            logger.info("\n✅ VALIDATION COMPLETE")

        except Exception as e:
            logger.error(f"Validation failed: {e}", exc_info=True)
            raise
        finally:
            self.close()


def main():
    import argparse

    parser = argparse.ArgumentParser(description='Validate countries in museum_item against authors table')
    parser.add_argument('--db', type=str,
                       default='androidApp/src/main/assets/heritage_sites.db',
                       help='Database path')

    args = parser.parse_args()

    validator = CountryValidator(args.db)
    validator.run()


if __name__ == '__main__':
    main()
