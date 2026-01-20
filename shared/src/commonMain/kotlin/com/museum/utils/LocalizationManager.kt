package com.museum.utils

expect object LocalizationManager {
    fun getCurrentLanguageCode(): String
}

enum class SupportedLanguage(val code: String, val displayName: String) {
    ENGLISH("en", "English"),
    ROMANIAN("ro", "Română"),
    ITALIAN("it", "Italiano"),
    SPANISH("es", "Español"),
    GERMAN("de", "Deutsch"),
    FRENCH("fr", "Français"),
    PORTUGUESE("pt", "Português"),
    RUSSIAN("ru", "Русский"),
    ARABIC("ar", "العربية"),
    CHINESE("zh", "中文"),
    JAPANESE("ja", "日本語"),

    HINDI("hi", "आधुनिक मानक हिन्दी"),
    HUNGARIAN("hu", "Magyar nyelv"),
    TURKISH("tr", "Türkçe "),
    POLISH("pl", "Język polski");

    fun getDisplayName(): String = displayName

    companion object {
        fun fromCode(code: String): SupportedLanguage {
            return entries.find { it.code.equals(code, ignoreCase = true) } ?: ENGLISH
        }
    }
}
