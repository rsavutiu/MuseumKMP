package com.museum.data.local

import app.cash.sqldelight.coroutines.asFlow
import app.cash.sqldelight.coroutines.mapToList
import com.museum.data.models.HeritageSite
import com.museum.utils.LocalizationManager
import com.museum.utils.SupportedLanguage
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.flowOn
import kotlinx.coroutines.flow.map
import kotlinx.coroutines.withContext

class MuseumDatabaseWrapper(driverFactory: DatabaseDriverFactory) {
    private val database = MuseumDatabase(driverFactory.createDriver())
    private val heritageQueries = database.heritageSiteQueries

    fun getAllSites(): Flow<List<HeritageSite>> {
        return heritageQueries.selectAll()
            .asFlow()
            .mapToList(Dispatchers.Default)
            .map { list -> list.map { it.toHeritageSite() } }
            .flowOn(Dispatchers.Default)
    }

    fun getSiteById(id: Long): Flow<HeritageSite?> {
        return heritageQueries.selectById(id)
            .asFlow()
            .mapToList(Dispatchers.Default)
            .map { it.firstOrNull()?.toHeritageSite() }
            .flowOn(Dispatchers.Default)
    }

    fun getFavoriteSites(): Flow<List<HeritageSite>> {
        return heritageQueries.selectFavorites()
            .asFlow()
            .mapToList(Dispatchers.Default)
            .map { list -> list.map { it.toHeritageSite() } }
            .flowOn(Dispatchers.Default)
    }

    fun searchSites(query: String): Flow<List<HeritageSite>> {
        // Get current language and search localized fields
        val languageCode = LocalizationManager.getCurrentLanguageCode()
        val language = SupportedLanguage.fromCode(languageCode)

        // Pass query four times for name, author, description, and location search
        val searchQuery = when (language) {
            SupportedLanguage.ROMANIAN -> heritageQueries.searchByNameRo(query, query, query, query)
            SupportedLanguage.ITALIAN -> heritageQueries.searchByNameIt(query, query, query, query)
            SupportedLanguage.SPANISH -> heritageQueries.searchByNameEs(query, query, query, query)
            SupportedLanguage.GERMAN -> heritageQueries.searchByNameDe(query, query, query, query)
            SupportedLanguage.FRENCH -> heritageQueries.searchByNameFr(query, query, query, query)
            SupportedLanguage.PORTUGUESE -> heritageQueries.searchByNamePt(query, query, query, query)
            SupportedLanguage.RUSSIAN -> heritageQueries.searchByNameRu(query, query, query, query)
            SupportedLanguage.ARABIC -> heritageQueries.searchByNameAr(query, query, query, query)
            SupportedLanguage.CHINESE -> heritageQueries.searchByNameZh(query, query, query, query)
            SupportedLanguage.JAPANESE -> heritageQueries.searchByNameJa(query, query, query, query)
            SupportedLanguage.ENGLISH -> heritageQueries.searchByName(query, query, query, query)
        }

        return searchQuery
            .asFlow()
            .mapToList(Dispatchers.Default)
            .map { list -> list.map { it.toHeritageSite() } }
            .flowOn(Dispatchers.Default)
    }

    suspend fun updateFavorite(id: Long, isFavorite: Boolean) {
        withContext(Dispatchers.Default) {
            heritageQueries.updateFavorite(
                isFavourite = if (isFavorite) "true" else "false",
                id = id
            )
        }
    }

    suspend fun markAsViewed(id: Long) {
        withContext(Dispatchers.Default) {
            heritageQueries.updateViewed(id)
        }
    }

    suspend fun getCount(): Long {
        return withContext(Dispatchers.Default) {
            heritageQueries.countAll().executeAsOne()
        }
    }

    fun getLatLong(location: String?): Pair<Double, Double>? {
        if (location.isNullOrBlank()) {
            return null
        }

        val parts = location.split(',').map { it.trim() }
        var lat: Double? = null
        var long: Double? = null

        when (parts.size) {
            // Case: "lat, long" - 2 parts
            2 -> {
                lat = parts[0].toDoubleOrNull()
                long = parts[1].toDoubleOrNull()
            }
            3 -> {
                if (parts[0].length == 2 && parts[1].length != 2) {
                    lat = (parts[0]+"."+parts[1]).toDoubleOrNull()
                    long = parts[2].toDoubleOrNull()
                }
                else {
                    lat = parts[0].toDoubleOrNull()
                    long = (parts[1]+"."+parts[2]).toDoubleOrNull()
                }
            }
            4 -> {
                lat = (parts[0]+"."+parts[1]).toDoubleOrNull()
                long = (parts[2]+"."+parts[3]).toDoubleOrNull()
            }
        }
        return Pair(lat ?: 0.0, long ?: 0.0)
    }

    private fun com.museum.data.Museum_item.toHeritageSite(): HeritageSite {
        val locationPair = getLatLong(location)
        return HeritageSite(
            id = id,
            name = paintingname,
            author = author,
            description = description,
            location = location,
            style = style,
            imageUrl = full_image_uri,
            isFavorite = isFavourite == "true",
            wasViewed = viewed == "true",
            // Localized names
            nameRo = paintingname_ro,
            nameIt = paintingname_it,
            nameEs = paintingname_es,
            nameDe = paintingname_de,
            nameFr = paintingname_fr,
            namePt = paintingname_pt,
            nameRu = paintingname_ru,
            nameAr = paintingname_ar,
            nameZh = paintingname_zh,
            nameJa = paintingname_ja,
            // Localized descriptions
            descriptionRo = description_ro,
            descriptionIt = description_it,
            descriptionEs = description_es,
            descriptionDe = description_de,
            descriptionFr = description_fr,
            descriptionPt = description_pt,
            descriptionRu = description_ru,
            descriptionAr = description_ar,
            descriptionZh = description_zh,
            descriptionJa = description_ja,
            // Localized styles
            styleRo = style_ro,
            styleIt = style_it,
            styleEs = style_es,
            styleDe = style_de,
            styleFr = style_fr,
            stylePt = style_pt,
            styleRu = style_ru,
            styleAr = style_ar,
            styleZh = style_zh,
            styleJa = style_ja,
            // Colors and location
            primaryColor = prim_color?.toInt(),
            secondaryColor = sec_color?.toInt(),
            backgroundColor = background_color?.toInt(),
            detailColor = detail_color?.toInt(),
            longitude = locationPair?.first,
            latitude = locationPair?.second
        )
    }
}
