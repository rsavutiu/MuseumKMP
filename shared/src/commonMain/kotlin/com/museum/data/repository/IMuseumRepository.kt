package com.museum.data.repository

import com.museum.data.models.HeritageSite
import kotlinx.coroutines.flow.Flow

/**
 * Repository contract for museum data.
 * Implementations should provide local/remote orchestration.
 */
interface IMuseumRepository {
    fun getAllSites(): Flow<List<HeritageSite>>
    fun getSiteById(id: Long): Flow<HeritageSite?>
    fun getFavoriteSites(): Flow<List<HeritageSite>>
    fun searchSites(query: String): Flow<List<HeritageSite>>
    suspend fun toggleFavorite(site: HeritageSite)
    suspend fun markAsViewed(siteId: Long)
    suspend fun getSiteCount(): Long
}