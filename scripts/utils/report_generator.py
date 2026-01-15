"""
Report Generation

Generates validation reports and SQL fix scripts.
"""

import json
import logging
from datetime import datetime
from pathlib import Path
from typing import List, Dict

logger = logging.getLogger(__name__)


class ReportGenerator:
    """Generates validation reports and SQL fix scripts"""

    def __init__(self, output_dir: str):
        self.output_dir = Path(output_dir)
        self.output_dir.mkdir(parents=True, exist_ok=True)

        self.stats = {
            'language_issues': 0,
            'language_fixed': 0,
            'missing_authors': 0,
            'authors_fixed': 0,
            'missing_images': 0,
            'images_downloaded': 0,
            'incorrect_images': 0,
            'missing_unesco_sites': 0,
            'sites_added': 0
        }

        self.issues = {
            'language': [],
            'authors': [],
            'images': [],
            'new_sites': []
        }

    def add_language_issue(self, issue: Dict):
        """Add language issue to report"""
        self.issues['language'].append(issue)
        self.stats['language_issues'] += 1

    def add_author_issue(self, issue: Dict):
        """Add author issue to report"""
        self.issues['authors'].append(issue)
        self.stats['missing_authors'] += 1

    def add_image_issue(self, issue: Dict):
        """Add image issue to report"""
        self.issues['images'].append(issue)
        if issue['type'] == 'missing':
            self.stats['missing_images'] += 1
        elif issue['type'] == 'incorrect':
            self.stats['incorrect_images'] += 1

    def add_new_site(self, site: Dict):
        """Add new UNESCO site to report"""
        self.issues['new_sites'].append(site)
        self.stats['missing_unesco_sites'] += 1

    def generate_sql_fixes(self, fixes: List[Dict]) -> Path:
        """Generate SQL fix script"""
        sql_path = self.output_dir / 'database_fixes.sql'

        with open(sql_path, 'w', encoding='utf-8') as f:
            f.write("-- UNESCO Heritage Database Fixes\n")
            f.write(f"-- Generated: {datetime.now().isoformat()}\n")
            f.write("-- REVIEW CAREFULLY BEFORE APPLYING\n\n")

            f.write("BEGIN TRANSACTION;\n\n")

            for fix in fixes:
                if fix['type'] == 'language_swap':
                    f.write(f"-- [ID {fix['id']}] {fix['name']}: Swap EN/RO fields\n")
                    f.write(f"UPDATE museum_item SET\n")
                    f.write(f"  description = {self._sql_escape(fix['new_en'])},\n")
                    f.write(f"  description_ro = {self._sql_escape(fix['new_ro'])}\n")
                    f.write(f"WHERE id = {fix['id']};\n\n")

                elif fix['type'] == 'update_description':
                    f.write(f"-- [ID {fix['id']}] {fix['name']}: Update {fix['field']}\n")
                    f.write(f"UPDATE museum_item SET\n")
                    f.write(f"  {fix['field']} = {self._sql_escape(fix['value'])}\n")
                    f.write(f"WHERE id = {fix['id']};\n\n")

                elif fix['type'] == 'update_author':
                    f.write(f"-- [ID {fix['id']}] {fix['name']}: Update author\n")
                    f.write(f"UPDATE museum_item SET\n")
                    f.write(f"  author = {self._sql_escape(fix['author'])}\n")
                    f.write(f"WHERE id = {fix['id']};\n\n")

                elif fix['type'] == 'insert_site':
                    f.write(f"-- [NEW] {fix['name']}: Add new UNESCO site\n")
                    f.write(f"INSERT INTO museum_item (paintingname, description, description_ro, ")
                    f.write(f"description_fr, description_es, description_ru, description_zh, description_ja, ")
                    f.write(f"description_pt, description_de, description_it, description_ar, ")
                    f.write(f"author, location, full_image_uri, style, isFavourite, viewed, visited)\n")
                    f.write(f"VALUES (\n")
                    f.write(f"  {self._sql_escape(fix['name'])},\n")
                    f.write(f"  {self._sql_escape(fix.get('description_en', ''))},\n")
                    f.write(f"  {self._sql_escape(fix.get('description_ro', ''))},\n")
                    f.write(f"  {self._sql_escape(fix.get('description_fr', ''))},\n")
                    f.write(f"  {self._sql_escape(fix.get('description_es', ''))},\n")
                    f.write(f"  {self._sql_escape(fix.get('description_ru', ''))},\n")
                    f.write(f"  {self._sql_escape(fix.get('description_zh', ''))},\n")
                    f.write(f"  {self._sql_escape(fix.get('description_ja', ''))},\n")
                    f.write(f"  {self._sql_escape(fix.get('description_pt', ''))},\n")
                    f.write(f"  {self._sql_escape(fix.get('description_de', ''))},\n")
                    f.write(f"  {self._sql_escape(fix.get('description_it', ''))},\n")
                    f.write(f"  {self._sql_escape(fix.get('description_ar', ''))},\n")
                    f.write(f"  {self._sql_escape(fix.get('author', 'UNESCO'))},\n")
                    f.write(f"  {self._sql_escape(fix.get('location', ''))},\n")
                    f.write(f"  {self._sql_escape(fix.get('image_uri', ''))},\n")
                    f.write(f"  {self._sql_escape(fix.get('style', 'World Heritage'))},\n")
                    f.write(f"  'false', 'false', 'false'\n")
                    f.write(f");\n\n")

            f.write("COMMIT;\n")

        return sql_path

    def _sql_escape(self, value: str) -> str:
        """Escape string for SQL"""
        if value is None:
            return 'NULL'
        # Escape single quotes
        escaped = value.replace("'", "''")
        return f"'{escaped}'"

    def generate_report(self) -> Path:
        """Generate human-readable validation report"""
        report_path = self.output_dir / 'validation_report.txt'

        with open(report_path, 'w', encoding='utf-8') as f:
            f.write("=" * 60 + "\n")
            f.write("UNESCO HERITAGE DATABASE VALIDATION REPORT\n")
            f.write("=" * 60 + "\n")
            f.write(f"Generated: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n")
            f.write(f"Database: heritage_sites.db\n\n")

            f.write("SUMMARY:\n")
            f.write("-" * 60 + "\n")
            f.write(f"✓ Language Issues: {self.stats['language_issues']} found, "
                   f"{self.stats['language_fixed']} fixed\n")
            f.write(f"✓ Missing Authors: {self.stats['missing_authors']} found, "
                   f"{self.stats['authors_fixed']} fixed\n")
            f.write(f"✓ Missing Images: {self.stats['missing_images']} found, "
                   f"{self.stats['images_downloaded']} downloaded\n")
            f.write(f"✓ Incorrect Images: {self.stats['incorrect_images']} found (flagged for review)\n")
            f.write(f"✓ Missing UNESCO Sites: {self.stats['missing_unesco_sites']} found, "
                   f"{self.stats['sites_added']} added\n\n")

            # Language issues detail
            if self.issues['language']:
                f.write("LANGUAGE ISSUES DETAIL:\n")
                f.write("-" * 60 + "\n")
                for issue in self.issues['language'][:20]:  # First 20
                    f.write(f"[ID {issue['id']}] {issue['name']}\n")
                    f.write(f"  Issue: {issue['issue']}\n")
                    f.write(f"  Fix: {issue['fix']}\n")
                    f.write(f"  Status: {issue.get('status', 'PENDING')}\n\n")

                if len(self.issues['language']) > 20:
                    f.write(f"... and {len(self.issues['language']) - 20} more\n\n")

            # Authors detail
            if self.issues['authors']:
                f.write("MISSING AUTHORS:\n")
                f.write("-" * 60 + "\n")
                for issue in self.issues['authors'][:20]:
                    f.write(f"[ID {issue['id']}] {issue['name']}\n")
                    f.write(f"  Issue: Author field empty\n")
                    f.write(f"  Status: {issue.get('status', 'PENDING')}\n\n")

                if len(self.issues['authors']) > 20:
                    f.write(f"... and {len(self.issues['authors']) - 20} more\n\n")

            # Images detail
            if self.issues['images']:
                f.write("IMAGE VALIDATION:\n")
                f.write("-" * 60 + "\n")
                for issue in self.issues['images'][:20]:
                    f.write(f"[ID {issue['id']}] {issue['name']}\n")
                    f.write(f"  Issue: {issue['type']}\n")
                    f.write(f"  Details: {issue.get('details', 'N/A')}\n")
                    f.write(f"  Status: {issue.get('status', 'PENDING')}\n\n")

                if len(self.issues['images']) > 20:
                    f.write(f"... and {len(self.issues['images']) - 20} more\n\n")

            # New sites
            if self.issues['new_sites']:
                f.write("NEW ENTRIES ADDED:\n")
                f.write("-" * 60 + "\n")
                for site in self.issues['new_sites'][:20]:
                    f.write(f"[NEW] {site['name']}\n")
                    f.write(f"  Location: {site.get('location', 'N/A')}\n")
                    f.write(f"  Year: {site.get('year', 'N/A')}\n\n")

                if len(self.issues['new_sites']) > 20:
                    f.write(f"... and {len(self.issues['new_sites']) - 20} more\n\n")

            f.write("\nSQL FIXES GENERATED:\n")
            f.write("-" * 60 + "\n")
            f.write(f"File: database_fixes.sql\n")
            f.write(f"IMPORTANT: Review SQL carefully before applying!\n")

        return report_path

    def generate_statistics_json(self) -> Path:
        """Generate machine-readable statistics"""
        stats_path = self.output_dir / 'statistics.json'

        with open(stats_path, 'w', encoding='utf-8') as f:
            json.dump({
                'timestamp': datetime.now().isoformat(),
                'statistics': self.stats,
                'issue_counts': {
                    'language': len(self.issues['language']),
                    'authors': len(self.issues['authors']),
                    'images': len(self.issues['images']),
                    'new_sites': len(self.issues['new_sites'])
                }
            }, f, indent=2)

        return stats_path
