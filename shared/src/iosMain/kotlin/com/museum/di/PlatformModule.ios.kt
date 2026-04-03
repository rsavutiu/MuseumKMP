package com.museum.di

import com.museum.data.local.DatabaseDriverFactory
import com.museum.domain.services.IosWallpaperService
import com.museum.domain.services.WallpaperService
import org.koin.dsl.module

actual val appPlatformModule = module {
    // DatabaseDriverFactory - no dependencies on iOS
    single { DatabaseDriverFactory() }

    // WallpaperService - iOS implementation
    single<WallpaperService> { IosWallpaperService() }
}
