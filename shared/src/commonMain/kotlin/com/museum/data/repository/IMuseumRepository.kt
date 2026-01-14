package com.museum.data.repository

import com.museum.data.models.HeritageSite
import com.museum.domain.model.Result
import kotlinx.coroutines.flow.Flow

/**
 * Repository contract for museum data.
 * Implementations should provide local/remote orchestration.
 */
interface IMuseumRepository {
    fun getAllSites(): Flow<Result<List<HeritageSite>>>
    fun getSiteById(id: Long): Flow<Result<HeritageSite?>>
    fun getFavoriteSites(): Flow<Result<List<HeritageSite>>>
    fun searchSites(query: String): Flow<Result<List<HeritageSite>>>
    suspend fun toggleFavorite(site: HeritageSite): Result<Unit>
    suspend fun markAsViewed(siteId: Long): Result<Unit>
    suspend fun getSiteCount(): Result<Long>
}