package com.museum.domain.usecases

import com.museum.data.models.HeritageSite
import com.museum.data.repository.IMuseumRepository
import com.museum.domain.model.Result

class ToggleFavoriteUseCase(private val repository: IMuseumRepository) {
    suspend operator fun invoke(site: HeritageSite): Result<Unit> {
        com.museum.utils.LOG("ToggleFavoriteUseCase.invoke() - CALLED for site ${site.id}:${site.name}")
        val result = repository.toggleFavorite(site)
        com.museum.utils.LOG("ToggleFavoriteUseCase.invoke() - COMPLETE")
        return result
    }
}