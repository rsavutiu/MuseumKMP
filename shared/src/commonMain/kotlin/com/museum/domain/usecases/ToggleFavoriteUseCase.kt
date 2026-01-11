package com.museum.domain.usecases

import com.museum.data.models.Artwork
import com.museum.data.repository.MuseumRepository

class ToggleFavoriteUseCase(private val repository: MuseumRepository) {
    operator fun invoke(artwork: Artwork) {
        repository.toggleFavorite(artwork)
    }
}
