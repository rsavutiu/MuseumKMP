package com.museum.data.models

import com.museum.utils.LocalizationManager
import com.museum.utils.SupportedLanguage

data class HeritageSite(
    val id: Long,
    val name: String,
    val author: String?,
    val description: String?,
    val location: String?,
    val style: String?,
    val imageUrl: String?,
    val isFavorite: Boolean = false,
    val wasViewed: Boolean = false,
    // Localized names
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
    // Localized descriptions
    val descriptionRo: String? = null,
    val descriptionIt: String? = null,
    val descriptionEs: String? = null,
    val descriptionDe: String? = null,
    val descriptionFr: String? = null,
    val descriptionPt: String? = null,
    val descriptionRu: String? = null,
    val descriptionAr: String? = null,
    val descriptionZh: String? = null,
    val descriptionJa: String? = null,
    // Localized styles
    val styleRo: String? = null,
    val styleIt: String? = null,
    val styleEs: String? = null,
    val styleDe: String? = null,
    val styleFr: String? = null,
    val stylePt: String? = null,
    val styleRu: String? = null,
    val styleAr: String? = null,
    val styleZh: String? = null,
    val styleJa: String? = null,
    // Colors and location
    val primaryColor: Int? = null,
    val secondaryColor: Int? = null,
    val backgroundColor: Int? = null,
    val detailColor: Int? = null,
    val latitude: Double? = null,
    val longitude: Double? = null
) {
    val countries: List<String>
        get() = author?.split(",")?.map { it.trim() } ?: emptyList()

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
            SupportedLanguage.ENGLISH -> null
        } ?: name
    }

    fun getLocalizedDescription(): String? {
        val language = SupportedLanguage.fromCode(LocalizationManager.getCurrentLanguageCode())
        return when (language) {
            SupportedLanguage.ROMANIAN -> descriptionRo
            SupportedLanguage.ITALIAN -> descriptionIt
            SupportedLanguage.SPANISH -> descriptionEs
            SupportedLanguage.GERMAN -> descriptionDe
            SupportedLanguage.FRENCH -> descriptionFr
            SupportedLanguage.PORTUGUESE -> descriptionPt
            SupportedLanguage.RUSSIAN -> descriptionRu
            SupportedLanguage.ARABIC -> descriptionAr
            SupportedLanguage.CHINESE -> descriptionZh
            SupportedLanguage.JAPANESE -> descriptionJa
            SupportedLanguage.ENGLISH -> null
        } ?: description
    }

    fun getLocalizedStyle(): String? {
        val language = SupportedLanguage.fromCode(LocalizationManager.getCurrentLanguageCode())
        return when (language) {
            SupportedLanguage.ROMANIAN -> styleRo
            SupportedLanguage.ITALIAN -> styleIt
            SupportedLanguage.SPANISH -> styleEs
            SupportedLanguage.GERMAN -> styleDe
            SupportedLanguage.FRENCH -> styleFr
            SupportedLanguage.PORTUGUESE -> stylePt
            SupportedLanguage.RUSSIAN -> styleRu
            SupportedLanguage.ARABIC -> styleAr
            SupportedLanguage.CHINESE -> styleZh
            SupportedLanguage.JAPANESE -> styleJa
            SupportedLanguage.ENGLISH -> null
        } ?: style
    }
}
