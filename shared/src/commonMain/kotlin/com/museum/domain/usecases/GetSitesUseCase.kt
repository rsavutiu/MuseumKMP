package com.museum.domain.usecases

import com.museum.data.models.HeritageSite
import com.museum.data.repository.MuseumRepository
import kotlinx.coroutines.flow.Flow

class GetSitesUseCase(private val repository: MuseumRepository) {
    operator fun invoke(): Flow<List<HeritageSite>> = repository.getAllSites()
}
