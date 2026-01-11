package com.museum.domain.usecases

import com.museum.data.models.Artwork
import com.museum.data.repository.MuseumRepository
import kotlinx.coroutines.flow.Flow

class GetArtworksUseCase(private val repository: MuseumRepository) {
    operator fun invoke(): Flow<List<Artwork>> = repository.getAllArtworks()
}
