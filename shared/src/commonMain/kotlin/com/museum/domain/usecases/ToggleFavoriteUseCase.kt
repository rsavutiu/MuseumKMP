package com.museum.domain.usecases

import com.museum.data.models.HeritageSite
import com.museum.data.repository.IMuseumRepository
import com.museum.domain.model.Result

class ToggleFavoriteUseCase(private val repository: IMuseumRepository) {
    suspend operator fun invoke(site: HeritageSite): Result<Unit> {
        return repository.toggleFavorite(site)
    }
}