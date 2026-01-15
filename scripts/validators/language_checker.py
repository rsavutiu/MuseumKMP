"""
Language Validation and Translation

Detects language mix-ups and handles translations.
"""

import logging
from typing import Dict, Optional

from langdetect import detect, LangDetectException
from deep_translator import GoogleTranslator

logger = logging.getLogger(__name__)


# Langdetect to our language code mapping
LANGDETECT_TO_CODE = {
    'en': 'en',
    'ro': 'ro',
    'it': 'it',
    'es': 'es',
    'de': 'de',
    'fr': 'fr',
    'pt': 'pt',
    'ru': 'ru',
    'ar': 'ar',
    'zh-cn': 'zh',
    'zh-tw': 'zh',
    'ja': 'ja'
}

# Our language code to Google Translate code mapping
OUR_CODE_TO_TRANSLATOR = {
    'en': 'en',
    'ro': 'ro',
    'it': 'it',
    'es': 'es',
    'de': 'de',
    'fr': 'fr',
    'pt': 'pt',
    'ru': 'ru',
    'ar': 'ar',
    'zh': 'zh-CN',  # Google Translate expects zh-CN
    'ja': 'ja'
}


class LanguageChecker:
    """Handles language detection, validation, and translation"""

    def __init__(self):
        self.translator = None
        self.translation_cache = {}

    def detect_language(self, text: str) -> Optional[str]:
        """Detect language of text, returns language code or None"""
        if not text or len(text.strip()) < 10:
            return None

        try:
            detected = detect(text)
            return LANGDETECT_TO_CODE.get(detected, detected)
        except LangDetectException:
            return None

    def detect_language_mixup(self, entry: Dict) -> Optional[Dict]:
        """
        Check if English/Romanian fields have swapped content
        Returns issue dict if mixup detected, None otherwise
        """
        en_desc = entry.get('description', '')
        ro_desc = entry.get('description_ro', '')

        if not en_desc or not ro_desc:
            # Check if we have Romanian in English field but no Romanian
            if en_desc and not ro_desc:
                en_lang = self.detect_language(en_desc)
                if en_lang == 'ro':
                    return {
                        'id': entry['id'],
                        'name': entry['paintingname'],
                        'issue': 'ro_in_en_field',
                        'fix': 'move_and_fetch_en',
                        'current_en': en_desc,
                        'current_ro': ro_desc
                    }
            return None

        # Detect languages
        en_lang = self.detect_language(en_desc)
        ro_lang = self.detect_language(ro_desc)

        # Check for swap
        if en_lang == 'ro' and ro_lang == 'en':
            return {
                'id': entry['id'],
                'name': entry['paintingname'],
                'issue': 'language_swap',
                'fix': 'swap_fields',
                'current_en': en_desc,
                'current_ro': ro_desc
            }
        elif en_lang == 'ro':
            return {
                'id': entry['id'],
                'name': entry['paintingname'],
                'issue': 'ro_in_en_field',
                'fix': 'move_and_fetch_en',
                'current_en': en_desc,
                'current_ro': ro_desc
            }
        elif ro_lang == 'en':
            return {
                'id': entry['id'],
                'name': entry['paintingname'],
                'issue': 'en_in_ro_field',
                'fix': 'move_and_fetch_ro',
                'current_en': en_desc,
                'current_ro': ro_desc
            }

        return None

    def translate_text(self, text: str, target_lang: str, source_lang: str = 'en') -> Optional[str]:
        """Translate text to target language"""
        if not text:
            return None

        # Convert our language codes to Google Translate codes
        translator_source = OUR_CODE_TO_TRANSLATOR.get(source_lang, source_lang)
        translator_target = OUR_CODE_TO_TRANSLATOR.get(target_lang, target_lang)

        logger.debug(f"Translating {source_lang} ({translator_source}) -> {target_lang} ({translator_target})")

        # Check cache
        cache_key = f"{source_lang}_{target_lang}_{hash(text)}"
        if cache_key in self.translation_cache:
            return self.translation_cache[cache_key]

        try:
            # Use deep-translator (free, no API key needed)
            translator = GoogleTranslator(source=translator_source, target=translator_target)
            translated = translator.translate(text)

            # Cache result
            self.translation_cache[cache_key] = translated
            return translated
        except Exception as e:
            logger.warning(f"Translation failed ({source_lang}->{target_lang}): Using ({translator_source}->{translator_target}): {e}")
            return None
