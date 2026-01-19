package com.museum.di

import com.museum.presentation.screens.detail.DetailViewModel
import com.museum.presentation.screens.home.HomeViewModel
import com.museum.presentation.screens.site.SiteDetailViewModel
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import org.koin.dsl.module

val viewModelModule = module {
    // Provide a CoroutineScope for ViewModels
    factory {
        com.museum.utils.LOG("DI - Creating NEW CoroutineScope")
        CoroutineScope(SupervisorJob() + Dispatchers.Main)
    }

    // HomeViewModel - Singleton (single instance for the entire app)
    single {
        com.museum.utils.LOG("DI - Creating HomeViewModel (SINGLETON)")
        HomeViewModel(
            getSitesUseCase = get(),
            searchSiteUseCase = get(),
            toggleFavoriteUseCase = get(),
            coroutineScope = get()
        )
    }

    // SiteDetailViewModel - Factory with parameter
    // Use parametersOf() for siteId
    factory { params ->
        val siteId = params.get<Long>()
        com.museum.utils.LOG("DI - Creating NEW SiteDetailViewModel for siteId=$siteId")
        SiteDetailViewModel(
            siteId = siteId,
            repository = get(),
            toggleFavoriteUseCase = get(),
            coroutineScope = get()
        )
    }

    // DetailViewModel - Factory with parameter
    // Use parametersOf() for siteId
    factory { params ->
        val siteId = params.get<Long>()
        com.museum.utils.LOG("DI - Creating NEW DetailViewModel for siteId=$siteId")
        DetailViewModel(
            siteId = siteId,
            repository = get(),
            wallpaperService = get(),
            coroutineScope = get()
        )
    }
}
