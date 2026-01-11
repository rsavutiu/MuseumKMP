package com.museum.data.repository

import com.museum.data.local.MuseumDatabaseWrapper
import com.museum.data.models.Artwork
import com.museum.data.models.Museum
import kotlinx.coroutines.flow.Flow

class MuseumRepository(private val database: MuseumDatabaseWrapper) {
    
    fun getAllArtworks(): Flow<List<Artwork>> = database.getAllArtworks()
    
    fun getArtworkById(id: Long): Flow<Artwork?> = database.getArtworkById(id)
    
    fun getFavoriteArtworks(): Flow<List<Artwork>> = database.getFavoriteArtworks()
    
    fun searchArtworks(query: String): Flow<List<Artwork>> = database.searchArtworks(query)
    
    fun toggleFavorite(artwork: Artwork) {
        database.updateFavorite(artwork.id, !artwork.isFavorite)
    }
    
    fun getAllMuseums(): Flow<List<Museum>> = database.getAllMuseums()
    
    fun initializeSampleData() {
        database.insertSampleData()
    }
}
