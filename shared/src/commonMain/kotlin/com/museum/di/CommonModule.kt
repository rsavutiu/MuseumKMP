package com.museum.di

import coil3.ImageLoader
import coil3.PlatformContext
import coil3.annotation.ExperimentalCoilApi
import com.museum.data.HeritageLanguageProvider
import com.museum.data.datasource.HeritageSiteLocalDataSource
import com.museum.data.repository.IMuseumRepository
import com.museum.data.repository.MuseumRepository
import com.museum.domain.usecases.GetSitesUseCase
import com.museum.domain.usecases.SearchSiteUseCase
import com.museum.domain.usecases.ToggleFavoriteUseCase
import com.museum.presentation.HeritageItemGrouper
import com.museum.utils.ImagePreloader
import com.whitelabel.core.domain.language.LanguageProvider
import com.whitelabel.core.domain.usecase.GetItemDetailUseCase
import com.whitelabel.core.presentation.home.ItemGrouper
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

    // Language Provider - Singleton
    single<LanguageProvider> { HeritageLanguageProvider() }

    // Use Cases - Factory (now backed by core generic use cases via typealiases)
    factory {
        com.museum.utils.LOG("DI - Creating NEW GetSitesUseCase")
        GetSitesUseCase(get<IMuseumRepository>())
    }
    factory {
        com.museum.utils.LOG("DI - Creating NEW SearchSiteUseCase")
        SearchSiteUseCase(get<IMuseumRepository>(), get())
    }
    factory {
        com.museum.utils.LOG("DI - Creating NEW ToggleFavoriteUseCase")
        ToggleFavoriteUseCase(get<IMuseumRepository>())
    }
    factory {
        com.museum.utils.LOG("DI - Creating NEW GetItemDetailUseCase")
        GetItemDetailUseCase(get<IMuseumRepository>())
    }

    // ItemGrouper - Heritage-specific: groups by country
    single<ItemGrouper<com.museum.data.models.HeritageSite>> { HeritageItemGrouper() }

    // Image Preloader - Singleton
    single { (context: PlatformContext) ->
        com.museum.utils.LOG("DI - Creating ImagePreloader (SINGLETON)")
        ImagePreloader(context, ImageLoader(context))
    }
}