package com.museum.data.repository

import com.museum.data.local.MuseumDatabaseWrapper
import com.museum.data.models.HeritageSite
import kotlinx.coroutines.flow.Flow

class MuseumRepository(private val database: MuseumDatabaseWrapper) {
    
    fun getAllSites(): Flow<List<HeritageSite>> = database.getAllSites()
    
    fun getSiteById(id: Long): Flow<HeritageSite?> = database.getSiteById(id)
    
    fun getFavoriteSites(): Flow<List<HeritageSite>> = database.getFavoriteSites()
    
    fun searchSites(query: String): Flow<List<HeritageSite>> = database.searchSites(query)
    
    suspend fun toggleFavorite(site: HeritageSite) {
        database.updateFavorite(site.id, !site.isFavorite)
    }
    
    suspend fun markAsViewed(siteId: Long) {
        database.markAsViewed(siteId)
    }
    
    suspend fun getSiteCount(): Long = database.getCount()
}
