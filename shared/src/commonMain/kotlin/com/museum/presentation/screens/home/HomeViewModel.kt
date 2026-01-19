package com.museum.presentation.screens.home

import androidx.lifecycle.ViewModel
import com.museum.data.models.Country
import com.museum.data.models.CountrySiteGroup
import com.museum.data.models.HeritageSite
import com.museum.data.repository.IMuseumRepository
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
    private val repository: IMuseumRepository,
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
                    when (result) {
                        is Result.Success -> {
                            if (result.data.isEmpty()) {
                                _uiState.value = HomeUiState.Empty
                            } else {
                                val groupedSites = groupSitesByCountry(result.data)
                                _uiState.value = HomeUiState.Success(
                                    sites = result.data,
                                    groupedSites = groupedSites
                                )
                            }
                        }
                        is Result.Error -> {
                            _uiState.value = HomeUiState.Error(result.exception.message ?: "Unknown error")
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

    private suspend fun groupSitesByCountry(sites: List<HeritageSite>): List<CountrySiteGroup> {
        // Flatten sites: duplicate sites with multiple countries
        val flattenedSites: List<Pair<String, HeritageSite>> = sites.flatMap { site ->
            site.countries.map { country -> country to site }
        }

        // Group by country
        val grouped: Map<String, List<Pair<String, HeritageSite>>> = flattenedSites.groupBy { it.first }

        // Get all unique country names
        val countryNames: List<String> = grouped.keys.toList()

        // Fetch country translations
        val countryTranslations: Map<String, Country> = when (val result = repository.getCountryTranslations(countryNames)) {
            is Result.Success -> result.data
            is Result.Error -> emptyMap()
        }

        // Sort countries alphabetically and sites within each country
        return grouped.entries
            .sortedBy { entry -> entry.key }
            .map { entry ->
                val countryName = entry.key
                val pairs = entry.value
                CountrySiteGroup(
                    country = countryTranslations[countryName] ?: Country(name = countryName),
                    sites = pairs.map { pair -> pair.second }.sortedBy { site -> site.name }
                )
            }
    }
}

sealed class HomeUiState {
    object Loading : HomeUiState()
    object Empty : HomeUiState()
    data class Success(
        val sites: List<HeritageSite>,
        val groupedSites: List<CountrySiteGroup>
    ) : HomeUiState()
    data class Error(val message: String) : HomeUiState()
}

enum class ViewMode {
    Grid, Map
}
