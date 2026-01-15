package com.museum.presentation.screens.home

import androidx.lifecycle.ViewModel
import com.museum.data.models.HeritageSite
import com.museum.domain.model.Result
import com.museum.domain.usecases.GetSitesUseCase
import com.museum.domain.usecases.SearchSiteUseCase
import com.museum.domain.usecases.ToggleFavoriteUseCase
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.ExperimentalCoroutinesApi
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch

class HomeViewModel(
    private val getSitesUseCase: GetSitesUseCase,
    private val searchSiteUseCase: SearchSiteUseCase,
    private val toggleFavoriteUseCase: ToggleFavoriteUseCase,
    private val coroutineScope: CoroutineScope
): ViewModel() {
    private val _searchQuery = MutableStateFlow("")
    val searchQuery: StateFlow<String> = _searchQuery.asStateFlow()

    private val _uiState = MutableStateFlow<HomeUiState>(HomeUiState.Loading)
    val uiState: StateFlow<HomeUiState> = _uiState.asStateFlow()

    private val _viewMode = MutableStateFlow<ViewMode>(ViewMode.Grid)
    val viewMode: StateFlow<ViewMode> = _viewMode.asStateFlow()

    init {
        loadSites()
    }

    @OptIn(ExperimentalCoroutinesApi::class)
    private fun loadSites() {
        coroutineScope.launch {
            searchQuery
                .flatMapLatest { query ->
                    if (query.isBlank()) getSitesUseCase() else searchSiteUseCase(query)
                }
                .collect { result ->
                    _uiState.value = when (result) {
                        is Result.Success -> {
                            if (result.data.isEmpty()) {
                                HomeUiState.Empty
                            } else {
                                HomeUiState.Success(result.data)
                            }
                        }
                        is Result.Error -> {
                            HomeUiState.Error(result.exception.message ?: "Unknown error")
                        }
                    }
                }
        }
    }

    fun onSearchQueryChange(query: String) {
        _searchQuery.value = query
    }

    fun onFavoriteClick(site: HeritageSite) {
        coroutineScope.launch {
            toggleFavoriteUseCase(site)
        }
    }

    fun setViewMode(mode: ViewMode) {
        _viewMode.value = mode
    }
}

sealed class HomeUiState {
    object Loading : HomeUiState()
    object Empty : HomeUiState()
    data class Success(val sites: List<HeritageSite>) : HomeUiState()
    data class Error(val message: String) : HomeUiState()
}

enum class ViewMode {
    Grid, Map
}
