package com.museum.domain.services

interface WallpaperService {
    suspend fun setWallpaper(imageUrl: String): Result<Unit>
}
