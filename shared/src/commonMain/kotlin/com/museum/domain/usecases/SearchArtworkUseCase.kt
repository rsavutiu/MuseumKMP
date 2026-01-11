package com.museum.domain.usecases

import com.museum.data.models.Artwork
import com.museum.data.repository.MuseumRepository
import kotlinx.coroutines.flow.Flow

class SearchArtworkUseCase(private val repository: MuseumRepository) {
    operator fun invoke(query: String): Flow<List<Artwork>> {
        return if (query.isBlank()) {
            repository.getAllArtworks()
        } else {
            repository.searchArtworks(query)
        }
    }
}
