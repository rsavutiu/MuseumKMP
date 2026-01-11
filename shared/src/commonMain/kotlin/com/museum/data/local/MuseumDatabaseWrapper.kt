package com.museum.data.local

import app.cash.sqldelight.coroutines.asFlow
import app.cash.sqldelight.coroutines.mapToList
import com.museum.data.models.Artwork
import com.museum.data.models.Museum
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.map

class MuseumDatabaseWrapper(driverFactory: DatabaseDriverFactory) {
    private val database = MuseumDatabase(driverFactory.createDriver())
    private val artworkQueries = database.artworkQueries
    private val museumQueries = database.museumQueries

    fun getAllArtworks(): Flow<List<Artwork>> {
        return artworkQueries.selectAll()
            .asFlow()
            .mapToList(Dispatchers.Default)
            .map { list -> list.map { it.toArtwork() } }
    }

    fun getArtworkById(id: Long): Flow<Artwork?> {
        return artworkQueries.selectById(id)
            .asFlow()
            .mapToList(Dispatchers.Default)
            .map { it.firstOrNull()?.toArtwork() }
    }

    fun getFavoriteArtworks(): Flow<List<Artwork>> {
        return artworkQueries.selectFavorites()
            .asFlow()
            .mapToList(Dispatchers.Default)
            .map { list -> list.map { it.toArtwork() } }
    }

    fun searchArtworks(query: String): Flow<List<Artwork>> {
        return artworkQueries.searchByTitle(query)
            .asFlow()
            .mapToList(Dispatchers.Default)
            .map { list -> list.map { it.toArtwork() } }
    }

    fun updateFavorite(id: Long, isFavorite: Boolean) {
        artworkQueries.updateFavorite(if (isFavorite) 1L else 0L, id)
    }

    fun getAllMuseums(): Flow<List<Museum>> {
        return museumQueries.selectAll()
            .asFlow()
            .mapToList(Dispatchers.Default)
            .map { list -> list.map { it.toMuseum() } }
    }

    fun insertSampleData() {
        museumQueries.insertMuseum(
            name = "The Louvre",
            location = "Paris, France",
            description = "The world's largest art museum",
            imageUrl = null
        )
        
        museumQueries.insertMuseum(
            name = "Metropolitan Museum of Art",
            location = "New York, USA",
            description = "The largest art museum in the United States",
            imageUrl = null
        )

        artworkQueries.insertArtwork(
            title = "Mona Lisa",
            artistName = "Leonardo da Vinci",
            year = "1503-1519",
            imageUrl = null,
            description = "Renaissance portrait masterpiece",
            museumId = 1L,
            isFavorite = 0L
        )
        
        artworkQueries.insertArtwork(
            title = "The Starry Night",
            artistName = "Vincent van Gogh",
            year = "1889",
            imageUrl = null,
            description = "Post-Impressionist masterpiece",
            museumId = 2L,
            isFavorite = 0L
        )
    }

    private fun com.museum.data.Artwork.toArtwork() = Artwork(
        id = id,
        title = title,
        artistName = artistName,
        year = year,
        imageUrl = imageUrl,
        description = description,
        museumId = museumId,
        isFavorite = isFavorite == 1L
    )

    private fun com.museum.data.Museum.toMuseum() = Museum(
        id = id,
        name = name,
        location = location,
        description = description,
        imageUrl = imageUrl
    )
}
