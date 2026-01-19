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
        com.museum.utils.LOG("HomeViewModel.init() - CREATED")
        loadSites()
    }

    @OptIn(ExperimentalCoroutinesApi::class)
    private fun loadSites() {
        com.museum.utils.LOG("HomeViewModel.loadSites() - STARTED")
        coroutineScope.launch {
            com.museum.utils.LOG("HomeViewModel.loadSites() - Coroutine LAUNCHED")
            searchQuery
                .onEach { query ->
                    com.museum.utils.LOG("HomeViewModel.loadSites() - searchQuery EMITTED: '$query'")
                }
                .flatMapLatest { query ->
                    com.museum.utils.LOG("HomeViewModel.loadSites() - flatMapLatest TRIGGERED for query='$query'")
                    val flow = if (query.isBlank()) getSitesUseCase() else searchSiteUseCase(query)
                    com.museum.utils.LOG("HomeViewModel.loadSites() - flatMapLatest RETURNING flow")
                    flow
                }
                .onEach { result ->
                    com.museum.utils.LOG("HomeViewModel.loadSites() - Flow EMITTED result: ${result::class.simpleName}, dataSize=${if (result is Result.Success) result.data.size else "N/A"}")
                }
                .collect { result ->
                    com.museum.utils.LOG("HomeViewModel.loadSites() - collect() CALLED, result type=${result::class.simpleName}")
                    com.museum.utils.checkMainThread()
                    val newState = com.museum.utils.measureTimeAndLog("HomeViewModel creating state") {
                        when (result) {
                            is Result.Success -> {
                                com.museum.utils.LOG("HomeViewModel.loadSites() - Creating Success state with ${result.data.size} sites")
                                if (result.data.isEmpty()) {
                                    HomeUiState.Empty
                                } else {
                                    HomeUiState.Success(result.data)
                                }
                            }
                            is Result.Error -> {
                                com.museum.utils.LOG("HomeViewModel.loadSites() - Creating Error state: ${result.exception.message}")
                                HomeUiState.Error(result.exception.message ?: "Unknown error")
                            }
                        }
                    }
                    com.museum.utils.LOG("HomeViewModel.loadSites() - Setting _uiState.value to ${newState::class.simpleName}")
                    com.museum.utils.measureTimeAndLog("HomeViewModel setting uiState") {
                        _uiState.value = newState
                    }
                    com.museum.utils.LOG("HomeViewModel.loadSites() - _uiState.value SET COMPLETE")
                }
        }
    }

    fun onSearchQueryChange(query: String) {
        com.museum.utils.LOG("HomeViewModel.onSearchQueryChange() - CALLED with query='$query'")
        _searchQuery.value = query
    }

    fun onFavoriteClick(site: HeritageSite) {
        com.museum.utils.LOG("HomeViewModel.onFavoriteClick() - CALLED for site ${site.id}:${site.name}")
        coroutineScope.launch {
            toggleFavoriteUseCase(site)
        }
    }

    fun setViewMode(mode: ViewMode) {
        com.museum.utils.LOG("HomeViewModel.setViewMode() - CALLED with mode=$mode")
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
