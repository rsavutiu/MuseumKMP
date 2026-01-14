package com.museum.di

import coil3.ImageLoader
import coil3.PlatformContext
import coil3.annotation.ExperimentalCoilApi
import com.museum.data.local.MuseumDatabaseWrapper
import com.museum.data.repository.MuseumRepository
import com.museum.domain.usecases.GetSitesUseCase
import com.museum.domain.usecases.SearchSiteUseCase
import com.museum.domain.usecases.ToggleFavoriteUseCase
import com.museum.utils.ImagePreloader
import org.koin.dsl.module

@OptIn(ExperimentalCoilApi::class)
val commonModule = module {
    // Database - Singleton
    single { MuseumDatabaseWrapper(get()) }

    // Repository - Singleton
    single { MuseumRepository(get()) }

    // Use Cases - Factory (lightweight, can be created each time)
    factory { GetSitesUseCase(get()) }
    factory { SearchSiteUseCase(get()) }
    factory { ToggleFavoriteUseCase(get()) }

    // Image Preloader - Singleton
    single { (context: PlatformContext) ->
        ImagePreloader(context, ImageLoader(context))
    }
}
