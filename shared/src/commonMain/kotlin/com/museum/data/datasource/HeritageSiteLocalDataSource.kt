package com.museum.data.datasource

import app.cash.sqldelight.coroutines.asFlow
import app.cash.sqldelight.coroutines.mapToList
import com.museum.data.local.DatabaseDriverFactory
import com.museum.data.local.MuseumDatabase
import com.museum.data.Museum_item
import com.museum.utils.LocalizationManager
import com.museum.utils.SupportedLanguage
import kotlinx.coroutines.CoroutineDispatcher
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.firstOrNull
import kotlinx.coroutines.flow.flowOn
import kotlinx.coroutines.withContext

class HeritageSiteLocalDataSource(
    driverFactory: DatabaseDriverFactory,
    private val dispatcher: CoroutineDispatcher
) {
    private val database = MuseumDatabase(driverFactory.createDriver())
    private val heritageQueries = database.heritageSiteQueries

    fun getAllSites(): Flow<List<Museum_item>> {
        return heritageQueries.selectAll()
            .asFlow()
            .mapToList(dispatcher)
            .flowOn(dispatcher)
    }

    fun getSiteById(id: Long): Flow<List<Museum_item>?> {
        return heritageQueries.selectById(id)
            .asFlow()
            .mapToList(dispatcher)
            .flowOn(dispatcher)
    }

    fun getFavoriteSites(): Flow<List<Museum_item>> {
        return heritageQueries.selectFavorites()
            .asFlow()
            .mapToList(dispatcher)
            .flowOn(dispatcher)
    }

    fun searchSites(query: String): Flow<List<Museum_item>> {
        val languageCode = LocalizationManager.getCurrentLanguageCode()
        val language = SupportedLanguage.fromCode(languageCode)

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
            .mapToList(dispatcher)
            .flowOn(dispatcher)
    }

    suspend fun updateFavorite(id: Long, isFavorite: Boolean) {
        withContext(dispatcher) {
            heritageQueries.updateFavorite(
                isFavourite = if (isFavorite) "true" else "false",
                id = id
            )
        }
    }

    suspend fun markAsViewed(id: Long) {
        withContext(dispatcher) {
            heritageQueries.updateViewed(id)
        }
    }

    suspend fun getCount(): Long {
        return withContext(dispatcher) {
            heritageQueries.countAll().executeAsOne()
        }
    }
}
