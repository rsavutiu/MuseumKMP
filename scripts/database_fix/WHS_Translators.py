import time
import logging
from typing import Optional
from deep_translator import GoogleTranslator
from WHS_Models import LANG_MAP

logger = logging.getLogger(__name__)


class TranslationService:
    """Handles bulk translation with rate limiting."""

    def translate(self, text: str, target_lang: str) -> Optional[str]:
        if not text or not text.strip():
            return None

        try:
            api_lang = LANG_MAP.get(target_lang, target_lang)
            translator = GoogleTranslator(source='en', target=api_lang)
            # Cap at 5000 chars for API safety
            result = translator.translate(text[:5000])
            time.sleep(0.3)
            return result
        except Exception as e:
            logger.error(f"Translation to {target_lang} failed: {e}")
            return None