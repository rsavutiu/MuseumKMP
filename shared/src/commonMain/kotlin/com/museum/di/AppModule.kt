package com.museum.di

import com.museum.data.local.DatabaseDriverFactory
import com.museum.data.local.MuseumDatabaseWrapper
import com.museum.data.repository.MuseumRepository
import com.museum.domain.usecases.*

class AppModule(driverFactory: DatabaseDriverFactory) {
    
    private val database = MuseumDatabaseWrapper(driverFactory)
    
    val repository = MuseumRepository(database)
    
    val getArtworksUseCase = GetArtworksUseCase(repository)
    val searchArtworkUseCase = SearchArtworkUseCase(repository)
    val toggleFavoriteUseCase = ToggleFavoriteUseCase(repository)
}
