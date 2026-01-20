package com.museum.data.models

import com.museum.utils.LocalizationManager
import com.museum.utils.SupportedLanguage

data class Country(
    val name: String,
    val nameRo: String? = null,
    val nameIt: String? = null,
    val nameEs: String? = null,
    val nameDe: String? = null,
    val nameFr: String? = null,
    val namePt: String? = null,
    val nameRu: String? = null,
    val nameAr: String? = null,
    val nameZh: String? = null,
    val nameJa: String? = null,
    val nameTr: String? = null,
    val namePl: String? = null,
    val nameHu: String? = null,
    val nameHi: String? = null
) {
    fun getLocalizedName(): String {
        val language = SupportedLanguage.fromCode(LocalizationManager.getCurrentLanguageCode())
        return when (language) {
            SupportedLanguage.ROMANIAN -> nameRo
            SupportedLanguage.ITALIAN -> nameIt
            SupportedLanguage.SPANISH -> nameEs
            SupportedLanguage.GERMAN -> nameDe
            SupportedLanguage.FRENCH -> nameFr
            SupportedLanguage.PORTUGUESE -> namePt
            SupportedLanguage.RUSSIAN -> nameRu
            SupportedLanguage.ARABIC -> nameAr
            SupportedLanguage.CHINESE -> nameZh
            SupportedLanguage.JAPANESE -> nameJa
            SupportedLanguage.ENGLISH -> name
            SupportedLanguage.HINDI -> nameHi
            SupportedLanguage.HUNGARIAN -> nameHu
            SupportedLanguage.TURKISH -> nameTr
            SupportedLanguage.POLISH -> namePl
        } ?: name
    }
}
