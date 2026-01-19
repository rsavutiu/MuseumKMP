package com.museum.data.repository

import com.museum.data.datasource.HeritageSiteLocalDataSource
import com.museum.data.mapper.HeritageSiteMapper.toHeritageSite
import com.museum.data.mapper.HeritageSiteMapper.toHeritageSites
import com.museum.data.models.Country
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
                Result.Success(it.toHeritageSites())
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
            }
            .map<List<com.museum.data.Museum_item>?, Result<HeritageSite?>> { it ->
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

    override suspend fun getCountryTranslations(countryNames: List<String>): Result<Map<String, Country>> {
        return try {
            val translations = dataSource.getCountryTranslations(countryNames)
            val countries = translations.mapValues { (_, translation) ->
                Country(
                    name = translation.name ?: "",
                    nameRo = translation.name_ro,
                    nameIt = translation.name_it,
                    nameEs = translation.name_es,
                    nameDe = translation.name_de,
                    nameFr = translation.name_fr,
                    namePt = translation.name_pt,
                    nameRu = translation.name_ru,
                    nameAr = translation.name_ar,
                    nameZh = translation.name_zh,
                    nameJa = translation.name_ja
                )
            }
            Result.Success(countries)
        } catch (e: Exception) {
            Result.Error(e)
        }
    }
}