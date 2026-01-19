package com.museum.presentation.screens.detail

import androidx.lifecycle.ViewModel
import com.museum.data.models.HeritageSite
import com.museum.domain.model.Result
import com.museum.domain.services.WallpaperService
import com.museum.domain.usecases.GetSitesUseCase
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch

class DetailViewModel(
    private val siteId: Long,
    private val repository: com.museum.data.repository.IMuseumRepository,
    private val wallpaperService: WallpaperService,
    private val coroutineScope: CoroutineScope
): ViewModel() {
    private val _uiState = MutableStateFlow<DetailUiState>(DetailUiState.Loading)
    val uiState: StateFlow<DetailUiState> = _uiState.asStateFlow()

    private val _wallpaperStatus = MutableStateFlow<WallpaperStatus>(WallpaperStatus.Idle)
    val wallpaperStatus: StateFlow<WallpaperStatus> = _wallpaperStatus.asStateFlow()

    init {
        com.museum.utils.LOG("DetailViewModel.init() - CREATED for siteId=$siteId")
        loadSite()
    }

    private fun loadSite() {
        com.museum.utils.LOG("DetailViewModel.loadSite() - STARTED for siteId=$siteId - Using getSiteById instead of getAllSites")
        coroutineScope.launch {
            com.museum.utils.LOG("DetailViewModel.loadSite() - Coroutine LAUNCHED")
            repository.getSiteById(siteId)
                .onEach { result ->
                    com.museum.utils.LOG("DetailViewModel.loadSite() - Flow EMITTED result: ${result::class.simpleName}")
                }
                .collect { result ->
                    com.museum.utils.LOG("DetailViewModel.loadSite() - collect() CALLED, result type=${result::class.simpleName}")
                    val newState = when (result) {
                        is Result.Success -> {
                            val site = result.data
                            com.museum.utils.LOG("DetailViewModel.loadSite() - Found site: ${site?.name ?: "NOT FOUND"}")
                            if (site != null) {
                                DetailUiState.Success(site)
                            } else {
                                DetailUiState.Error("Site not found")
                            }
                        }
                        is Result.Error -> {
                            com.museum.utils.LOG("DetailViewModel.loadSite() - Error: ${result.exception.message}")
                            DetailUiState.Error(result.exception.message ?: "Unknown error")
                        }
                    }
                    com.museum.utils.LOG("DetailViewModel.loadSite() - Setting _uiState.value to ${newState::class.simpleName}")
                    _uiState.value = newState
                    com.museum.utils.LOG("DetailViewModel.loadSite() - _uiState.value SET COMPLETE")
                }
        }
    }

    fun setAsWallpaper() {
        com.museum.utils.LOG("DetailViewModel.setAsWallpaper() - CALLED")
        val currentState = _uiState.value
        if (currentState !is DetailUiState.Success) {
            com.museum.utils.LOG("DetailViewModel.setAsWallpaper() - Current state is NOT Success, returning")
            return
        }

        val imageUrl = currentState.site.imageUrl?.split(",")?.firstOrNull()?.trim()
        if (imageUrl.isNullOrBlank()) {
            com.museum.utils.LOG("DetailViewModel.setAsWallpaper() - No image URL available")
            _wallpaperStatus.value = WallpaperStatus.Error("No image available")
            return
        }

        com.museum.utils.LOG("DetailViewModel.setAsWallpaper() - Setting wallpaper for imageUrl=$imageUrl")
        coroutineScope.launch {
            _wallpaperStatus.value = WallpaperStatus.Loading
            val result = wallpaperService.setWallpaper(imageUrl)
            _wallpaperStatus.value = if (result.isSuccess) {
                com.museum.utils.LOG("DetailViewModel.setAsWallpaper() - SUCCESS")
                WallpaperStatus.Success
            } else {
                com.museum.utils.LOG("DetailViewModel.setAsWallpaper() - ERROR: ${result.exceptionOrNull()?.message}")
                WallpaperStatus.Error(result.exceptionOrNull()?.message ?: "Failed to set wallpaper")
            }
        }
    }

    fun resetWallpaperStatus() {
        com.museum.utils.LOG("DetailViewModel.resetWallpaperStatus() - CALLED")
        _wallpaperStatus.value = WallpaperStatus.Idle
    }
}

sealed class DetailUiState {
    object Loading : DetailUiState()
    data class Success(val site: HeritageSite) : DetailUiState()
    data class Error(val message: String) : DetailUiState()
}

sealed class WallpaperStatus {
    object Idle : WallpaperStatus()
    object Loading : WallpaperStatus()
    object Success : WallpaperStatus()
    data class Error(val message: String) : WallpaperStatus()
}
