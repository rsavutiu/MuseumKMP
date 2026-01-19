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
    single<CoroutineDispatcher> {
        com.museum.utils.LOG("DI - Creating CoroutineDispatcher (SINGLETON)")
        Dispatchers.Default
    }

    // Data Source - Singleton
    single {
        com.museum.utils.LOG("DI - Creating HeritageSiteLocalDataSource (SINGLETON)")
        HeritageSiteLocalDataSource(get(), get())
    }

    // Repository - bind to interface to enable testing and decoupling
    single<IMuseumRepository> {
        com.museum.utils.LOG("DI - Creating MuseumRepository (SINGLETON)")
        MuseumRepository(get())
    }

    // Use Cases - Factory (lightweight, can be created each time)
    factory {
        com.museum.utils.LOG("DI - Creating NEW GetSitesUseCase")
        GetSitesUseCase(get())
    }
    factory {
        com.museum.utils.LOG("DI - Creating NEW SearchSiteUseCase")
        SearchSiteUseCase(get())
    }
    factory {
        com.museum.utils.LOG("DI - Creating NEW ToggleFavoriteUseCase")
        ToggleFavoriteUseCase(get())
    }

    // Image Preloader - Singleton
    single { (context: PlatformContext) ->
        com.museum.utils.LOG("DI - Creating ImagePreloader (SINGLETON)")
        ImagePreloader(context, ImageLoader(context))
    }
}