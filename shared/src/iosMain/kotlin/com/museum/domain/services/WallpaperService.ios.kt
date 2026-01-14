package com.museum.domain.services

class IosWallpaperService : WallpaperService {
    override suspend fun setWallpaper(imageUrl: String): Result<Unit> {
        return Result.failure(UnsupportedOperationException("Wallpaper setting not supported on iOS"))
    }
}
