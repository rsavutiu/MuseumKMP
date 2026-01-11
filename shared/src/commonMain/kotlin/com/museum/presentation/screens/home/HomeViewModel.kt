package com.museum.presentation.screens.home

import com.museum.data.models.Artwork
import com.museum.domain.usecases.GetArtworksUseCase
import com.museum.domain.usecases.SearchArtworkUseCase
import com.museum.domain.usecases.ToggleFavoriteUseCase
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch

class HomeViewModel(
    private val getArtworksUseCase: GetArtworksUseCase,
    private val searchArtworkUseCase: SearchArtworkUseCase,
    private val toggleFavoriteUseCase: ToggleFavoriteUseCase,
    private val coroutineScope: CoroutineScope
) {
    private val _searchQuery = MutableStateFlow("")
    val searchQuery: StateFlow<String> = _searchQuery.asStateFlow()

    private val _uiState = MutableStateFlow<HomeUiState>(HomeUiState.Loading)
    val uiState: StateFlow<HomeUiState> = _uiState.asStateFlow()

    init {
        loadArtworks()
    }

    private fun loadArtworks() {
        coroutineScope.launch {
            searchQuery
                .flatMapLatest { query ->
                    if (query.isBlank()) getArtworksUseCase() else searchArtworkUseCase(query)
                }
                .catch { e ->
                    _uiState.value = HomeUiState.Error(e.message ?: "Unknown error")
                }
                .collect { artworks ->
                    _uiState.value = if (artworks.isEmpty()) HomeUiState.Empty else HomeUiState.Success(artworks)
                }
        }
    }

    fun onSearchQueryChange(query: String) {
        _searchQuery.value = query
    }

    fun onFavoriteClick(artwork: Artwork) {
        coroutineScope.launch {
            toggleFavoriteUseCase(artwork)
        }
    }
}

sealed class HomeUiState {
    object Loading : HomeUiState()
    object Empty : HomeUiState()
    data class Success(val artworks: List<Artwork>) : HomeUiState()
    data class Error(val message: String) : HomeUiState()
}
