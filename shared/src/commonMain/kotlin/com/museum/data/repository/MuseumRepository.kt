package com.museum.data.repository

import com.museum.data.local.MuseumDatabaseWrapper
import com.museum.data.models.HeritageSite
import kotlinx.coroutines.flow.Flow

/**
 * Concrete implementation backed by MuseumDatabaseWrapper.
 * Implements IMuseumRepository so higher layers depend on the interface.
 */
class MuseumRepository(private val database: MuseumDatabaseWrapper) : IMuseumRepository {

    override fun getAllSites(): Flow<List<HeritageSite>> = database.getAllSites()

    override fun getSiteById(id: Long): Flow<HeritageSite?> = database.getSiteById(id)

    override fun getFavoriteSites(): Flow<List<HeritageSite>> = database.getFavoriteSites()

    override fun searchSites(query: String): Flow<List<HeritageSite>> = database.searchSites(query)

    override suspend fun toggleFavorite(site: HeritageSite) {
        database.updateFavorite(site.id, !site.isFavorite)
    }

    override suspend fun markAsViewed(siteId: Long) {
        database.markAsViewed(siteId)
    }

    override suspend fun getSiteCount(): Long = database.getCount()
}