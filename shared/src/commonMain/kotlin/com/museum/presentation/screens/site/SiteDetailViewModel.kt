package com.museum.presentation.screens.site

import com.museum.data.models.HeritageSite
import com.museum.data.repository.IMuseumRepository
import com.museum.data.repository.MuseumRepository
import com.museum.domain.model.Result
import com.museum.domain.usecases.ToggleFavoriteUseCase
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch

class SiteDetailViewModel(
    private val siteId: Long,
    private val repository: IMuseumRepository,
    private val toggleFavoriteUseCase: ToggleFavoriteUseCase,
    private val coroutineScope: CoroutineScope
) {
    private val _uiState = MutableStateFlow<SiteDetailUiState>(SiteDetailUiState.Loading)
    val uiState: StateFlow<SiteDetailUiState> = _uiState.asStateFlow()

    init {
        loadSite()
    }

    private fun loadSite() {
        coroutineScope.launch {
            repository.getSiteById(siteId)
                .collect { result ->
                    _uiState.value = when (result) {
                        is Result.Success -> {
                            val site = result.data
                            if (site != null) {
                                repository.markAsViewed(siteId)
                                SiteDetailUiState.Success(site)
                            } else {
                                SiteDetailUiState.Error("Site not found")
                            }
                        }
                        is Result.Error -> {
                            SiteDetailUiState.Error(result.exception.message ?: "Unknown error")
                        }
                    }
                }
        }
    }

    fun onFavoriteClick(site: HeritageSite) {
        coroutineScope.launch {
            toggleFavoriteUseCase(site)
        }
    }
}

sealed class SiteDetailUiState {
    object Loading : SiteDetailUiState()
    data class Success(val site: HeritageSite) : SiteDetailUiState()
    data class Error(val message: String) : SiteDetailUiState()
}
