package com.museum.domain.usecases

import com.museum.data.models.HeritageSite
import com.museum.data.repository.IMuseumRepository
import com.museum.domain.model.Result
import kotlinx.coroutines.flow.Flow

class SearchSiteUseCase(private val repository: IMuseumRepository) {
    operator fun invoke(query: String): Flow<Result<List<HeritageSite>>> {
        return if (query.isBlank()) {
            repository.getAllSites()
        } else {
            repository.searchSites(query)
        }
    }
}
