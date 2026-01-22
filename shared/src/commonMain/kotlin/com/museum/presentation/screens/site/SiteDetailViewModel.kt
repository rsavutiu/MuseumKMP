package com.museum.presentation.screens.site

import androidx.lifecycle.ViewModel
import com.museum.data.models.Country
import com.museum.data.models.HeritageSite
import com.museum.data.repository.IMuseumRepository
import com.museum.data.repository.MuseumRepository
import com.museum.domain.model.Result
import com.museum.domain.usecases.ToggleFavoriteUseCase
import com.museum.utils.LanguagePreferences
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.ExperimentalCoroutinesApi
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch

class SiteDetailViewModel(
    private val siteId: Long,
    private val repository: IMuseumRepository,
    private val toggleFavoriteUseCase: ToggleFavoriteUseCase,
    private val coroutineScope: CoroutineScope
): ViewModel() {
    private val _uiState = MutableStateFlow<SiteDetailUiState>(SiteDetailUiState.Loading)
    val uiState: StateFlow<SiteDetailUiState> = _uiState.asStateFlow()

    init {
        loadSite()
    }

    @OptIn(ExperimentalCoroutinesApi::class)
    private fun loadSite() {
        coroutineScope.launch {
            // Combine site data with language changes to re-fetch translations when language changes
            combine(
                repository.getSiteById(siteId),
                LanguagePreferences.selectedLanguage
            ) { result, _ ->
                result // Language change triggers recomposition
            }
                .collect { result ->
                    _uiState.value = when (result) {
                        is Result.Success -> {
                            val site = result.data
                            if (site != null) {
                                repository.markAsViewed(siteId)
                                // Fetch country translations for localized display
                                val localizedCountries = getLocalizedCountries(site)
                                SiteDetailUiState.Success(site, localizedCountries)
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

    private suspend fun getLocalizedCountries(site: HeritageSite): String {
        val countryNames = site.countries
        if (countryNames.isEmpty()) {
            return ""
        }

        // Fetch country translations from database
        val countryTranslations = when (val result = repository.getCountryTranslations(countryNames)) {
            is Result.Success -> result.data
            is Result.Error -> emptyMap()
        }

        // Build localized country string
        return countryNames.joinToString(", ") { countryName ->
            countryTranslations[countryName]?.getLocalizedName() ?: countryName
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
    data class Success(val site: HeritageSite, val localizedCountries: String) : SiteDetailUiState()
    data class Error(val message: String) : SiteDetailUiState()
}
