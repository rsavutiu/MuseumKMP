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

    override fun getAllSites(): Flow<Result<List<HeritageSite>>> {
        com.museum.utils.LOG("MuseumRepository.getAllSites() - CALLED")
        return dataSource.getAllSites()
            .map<List<com.museum.data.Museum_item>, Result<List<HeritageSite>>> {
                com.museum.utils.LOG("MuseumRepository.getAllSites() - Mapping ${it.size} items")
                com.museum.utils.checkMainThread()
                val result = com.museum.utils.measureTimeAndLog("getAllSites mapping ${it.size} items") {
                    it.toHeritageSites()
                }
                Result.Success(result)
            }
            .catch {
                com.museum.utils.LOG("MuseumRepository.getAllSites() - ERROR: ${it.message}")
                emit(Result.Error(it))
            }
    }

    override fun getSiteById(id: Long): Flow<Result<HeritageSite?>> {
        com.museum.utils.LOG("MuseumRepository.getSiteById() - CALLED for id=$id")
        return dataSource.getSiteById(id)
            .onEach { items ->
                com.museum.utils.LOG("MuseumRepository.getSiteById() - DataSource EMITTED ${items?.size ?: 0} items")
                com.museum.utils.checkMainThread()
            }
            .map<List<com.museum.data.Museum_item>?, Result<HeritageSite?>> { it ->
                val result = com.museum.utils.measureTimeAndLog("getSiteById($id) mapping") {
                    val firstItem = it?.firstOrNull()
                    if (firstItem == null) {
                        com.museum.utils.LOG("MuseumRepository.getSiteById() - Site NOT FOUND for id=$id")
                        Result.Error(Exception("Site not found"))
                    }
                    else {
                        com.museum.utils.LOG("MuseumRepository.getSiteById() - Site FOUND: ${firstItem.name}")
                        Result.Success(firstItem.toHeritageSite())
                    }
                }
                result
            }
            .catch {
                com.museum.utils.LOG("MuseumRepository.getSiteById() - ERROR: ${it.message}")
                emit(Result.Error(it))
            }
    }

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
        com.museum.utils.LOG("MuseumRepository.toggleFavorite() - CALLED for site ${site.id}, newValue=${!site.isFavorite}")
        return try {
            dataSource.updateFavorite(site.id, !site.isFavorite)
            com.museum.utils.LOG("MuseumRepository.toggleFavorite() - SUCCESS")
            Result.Success(Unit)
        } catch (e: Exception) {
            com.museum.utils.LOG("MuseumRepository.toggleFavorite() - ERROR: ${e.message}")
            Result.Error(e)
        }
    }

    override suspend fun markAsViewed(siteId: Long): Result<Unit> {
        com.museum.utils.LOG("MuseumRepository.markAsViewed() - CALLED for site $siteId")
        return try {
            dataSource.markAsViewed(siteId)
            com.museum.utils.LOG("MuseumRepository.markAsViewed() - SUCCESS")
            Result.Success(Unit)
        } catch (e: Exception) {
            com.museum.utils.LOG("MuseumRepository.markAsViewed() - ERROR: ${e.message}")
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