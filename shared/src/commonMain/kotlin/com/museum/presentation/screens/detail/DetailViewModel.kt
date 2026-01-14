package com.museum.presentation.screens.detail

import com.museum.data.models.HeritageSite
import com.museum.domain.services.WallpaperService
import com.museum.domain.usecases.GetSitesUseCase
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch

class DetailViewModel(
    private val siteId: Long,
    private val getSitesUseCase: GetSitesUseCase,
    private val wallpaperService: WallpaperService,
    private val coroutineScope: CoroutineScope
) {
    private val _uiState = MutableStateFlow<DetailUiState>(DetailUiState.Loading)
    val uiState: StateFlow<DetailUiState> = _uiState.asStateFlow()

    private val _wallpaperStatus = MutableStateFlow<WallpaperStatus>(WallpaperStatus.Idle)
    val wallpaperStatus: StateFlow<WallpaperStatus> = _wallpaperStatus.asStateFlow()

    init {
        loadSite()
    }

    private fun loadSite() {
        coroutineScope.launch {
            getSitesUseCase()
                .catch { e ->
                    _uiState.value = DetailUiState.Error(e.message ?: "Unknown error")
                }
                .collect { sites ->
                    val site = sites.find { it.id == siteId }
                    _uiState.value = if (site != null) {
                        DetailUiState.Success(site)
                    } else {
                        DetailUiState.Error("Site not found")
                    }
                }
        }
    }

    fun setAsWallpaper() {
        val currentState = _uiState.value
        if (currentState !is DetailUiState.Success) return

        val imageUrl = currentState.site.imageUrl?.split(",")?.firstOrNull()?.trim()
        if (imageUrl.isNullOrBlank()) {
            _wallpaperStatus.value = WallpaperStatus.Error("No image available")
            return
        }

        coroutineScope.launch {
            _wallpaperStatus.value = WallpaperStatus.Loading
            val result = wallpaperService.setWallpaper(imageUrl)
            _wallpaperStatus.value = if (result.isSuccess) {
                WallpaperStatus.Success
            } else {
                WallpaperStatus.Error(result.exceptionOrNull()?.message ?: "Failed to set wallpaper")
            }
        }
    }

    fun resetWallpaperStatus() {
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
