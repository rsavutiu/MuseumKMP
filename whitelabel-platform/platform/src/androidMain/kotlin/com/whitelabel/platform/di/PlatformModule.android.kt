package com.whitelabel.platform.di

import com.whitelabel.platform.data.DatabaseDriverFactory
import com.whitelabel.platform.services.AndroidWallpaperService
import com.whitelabel.core.domain.service.WallpaperService
import org.koin.android.ext.koin.androidContext
import org.koin.dsl.module

actual val platformModule = module {
    // DatabaseDriverFactory - needs Android Context
    single { DatabaseDriverFactory(androidContext()) }

    // WallpaperService - Android implementation
    single<WallpaperService> { AndroidWallpaperService(androidContext()) }
}
