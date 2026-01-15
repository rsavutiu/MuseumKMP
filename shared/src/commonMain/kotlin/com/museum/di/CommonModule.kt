package com.museum.di

import coil3.ImageLoader
import coil3.PlatformContext
import coil3.annotation.ExperimentalCoilApi
import com.museum.data.datasource.HeritageSiteLocalDataSource
import com.museum.data.repository.IMuseumRepository
import com.museum.data.repository.MuseumRepository
import com.museum.domain.usecases.GetSitesUseCase
import com.museum.domain.usecases.SearchSiteUseCase
import com.museum.domain.usecases.ToggleFavoriteUseCase
import com.museum.utils.ImagePreloader
import kotlinx.coroutines.CoroutineDispatcher
import kotlinx.coroutines.Dispatchers
import org.koin.dsl.module

@OptIn(ExperimentalCoilApi::class)
val commonModule = module {
    // Dispatcher - Singleton
    single<CoroutineDispatcher> { Dispatchers.Default }

    // Data Source - Singleton
    single { HeritageSiteLocalDataSource(get(), get()) }

    // Repository - bind to interface to enable testing and decoupling
    single<IMuseumRepository> { MuseumRepository(get()) }

    // Use Cases - Factory (lightweight, can be created each time)
    factory { GetSitesUseCase(get()) }
    factory { SearchSiteUseCase(get()) }
    factory { ToggleFavoriteUseCase(get()) }

    // Image Preloader - Singleton
    single { (context: PlatformContext) ->
        ImagePreloader(context, ImageLoader(context))
    }
}