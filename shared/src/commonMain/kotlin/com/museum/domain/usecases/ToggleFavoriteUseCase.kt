package com.museum.domain.usecases

import com.museum.data.models.HeritageSite
import com.museum.data.repository.MuseumRepository

class ToggleFavoriteUseCase(private val repository: MuseumRepository) {
    suspend operator fun invoke(site: HeritageSite) {
        repository.toggleFavorite(site)
    }
}
