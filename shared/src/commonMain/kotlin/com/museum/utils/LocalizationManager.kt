package com.museum.utils

expect object LocalizationManager {
    fun getCurrentLanguageCode(): String
}

enum class SupportedLanguage(val code: String) {
    ENGLISH("en"),
    ROMANIAN("ro"),
    ITALIAN("it"),
    SPANISH("es"),
    GERMAN("de"),
    FRENCH("fr"),
    PORTUGUESE("pt"),
    RUSSIAN("ru"),
    ARABIC("ar"),
    CHINESE("zh"),
    JAPANESE("ja");

    companion object {
        fun fromCode(code: String): SupportedLanguage {
            return entries.find { it.code.equals(code, ignoreCase = true) } ?: ENGLISH
        }
    }
}
