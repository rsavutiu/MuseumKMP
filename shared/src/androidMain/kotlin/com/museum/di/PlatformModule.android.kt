package com.museum.di

import com.museum.data.local.DatabaseDriverFactory
import com.museum.domain.services.AndroidWallpaperService
import com.museum.domain.services.WallpaperService
import org.koin.android.ext.koin.androidContext
import org.koin.dsl.module

actual val platformModule = module {
    // DatabaseDriverFactory - needs Android Context
    single { DatabaseDriverFactory(androidContext()) }

    // WallpaperService - Android implementation
    single<WallpaperService> { AndroidWallpaperService(androidContext()) }
}
