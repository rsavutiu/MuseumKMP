package com.museum.domain.usecases

import com.museum.data.models.HeritageSite
import com.museum.data.repository.IMuseumRepository
import com.museum.domain.model.Result
import kotlinx.coroutines.flow.Flow

class GetSitesUseCase(private val repository: IMuseumRepository) {
    operator fun invoke(): Flow<Result<List<HeritageSite>>> {
        com.museum.utils.LOG("GetSitesUseCase.invoke() - CALLED")
        return repository.getAllSites()
    }
}