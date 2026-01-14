package com.museum.domain.usecases

import com.museum.data.models.HeritageSite
import com.museum.data.repository.IMuseumRepository
import kotlinx.coroutines.flow.Flow

class GetSitesUseCase(private val repository: IMuseumRepository) {
    operator fun invoke(): Flow<List<HeritageSite>> = repository.getAllSites()
}