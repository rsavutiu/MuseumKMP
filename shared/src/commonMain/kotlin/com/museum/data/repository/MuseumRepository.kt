package com.museum.data.repository

import com.museum.data.datasource.HeritageSiteLocalDataSource
import com.museum.data.mapper.HeritageSiteMapper.toHeritageSite
import com.museum.data.mapper.HeritageSiteMapper.toHeritageSites
import com.museum.data.models.HeritageSite
import com.museum.domain.model.Result
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.catch
import kotlinx.coroutines.flow.first
import kotlinx.coroutines.flow.firstOrNull
import kotlinx.coroutines.flow.map

/**
 * Concrete implementation backed by HeritageSiteLocalDataSource.
 * Implements IMuseumRepository so higher layers depend on the interface.
 */
class MuseumRepository(private val dataSource: HeritageSiteLocalDataSource) : IMuseumRepository {

    override fun getAllSites(): Flow<Result<List<HeritageSite>>> =
        dataSource.getAllSites()
            .map<List<com.museum.data.Museum_item>, Result<List<HeritageSite>>> {
                Result.Success(it.toHeritageSites())
            }
            .catch { emit(Result.Error(it)) }

    override fun getSiteById(id: Long): Flow<Result<HeritageSite?>> =
        dataSource.getSiteById(id).map<List<com.museum.data.Museum_item>?, Result<HeritageSite?>> { it ->
                val firstItem = it?.firstOrNull()
                if (firstItem == null) {
                    Result.Error(Exception("Site not found"))
                }
                else {
                        Result.Success(firstItem.toHeritageSite())
                    }
            }
            .catch { emit(Result.Error(it)) }

    override fun getFavoriteSites(): Flow<Result<List<HeritageSite>>> =
        dataSource.getFavoriteSites()
            .map<List<com.museum.data.Museum_item>, Result<List<HeritageSite>>> {
                Result.Success(it.toHeritageSites())
            }
            .catch { emit(Result.Error(it)) }

    override fun searchSites(query: String): Flow<Result<List<HeritageSite>>> =
        dataSource.searchSites(query)
            .map<List<com.museum.data.Museum_item>, Result<List<HeritageSite>>> {
                Result.Success(it.toHeritageSites())
            }
            .catch { emit(Result.Error(it)) }

    override suspend fun toggleFavorite(site: HeritageSite): Result<Unit> {
        return try {
            dataSource.updateFavorite(site.id, !site.isFavorite)
            Result.Success(Unit)
        } catch (e: Exception) {
            Result.Error(e)
        }
    }

    override suspend fun markAsViewed(siteId: Long): Result<Unit> {
        return try {
            dataSource.markAsViewed(siteId)
            Result.Success(Unit)
        } catch (e: Exception) {
            Result.Error(e)
        }
    }

    override suspend fun getSiteCount(): Result<Long> {
        return try {
            Result.Success(dataSource.getCount())
        } catch (e: Exception) {
            Result.Error(e)
        }
    }
}