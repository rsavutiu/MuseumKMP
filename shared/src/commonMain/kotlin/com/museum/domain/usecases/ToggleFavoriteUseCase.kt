package com.museum.domain.usecases

import com.museum.data.models.HeritageSite
import com.museum.data.repository.IMuseumRepository

class ToggleFavoriteUseCase(private val repository: IMuseumRepository) {
    suspend operator fun invoke(site: HeritageSite) {
        repository.toggleFavorite(site)
    }
}