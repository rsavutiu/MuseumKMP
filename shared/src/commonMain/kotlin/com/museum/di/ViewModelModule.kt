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
        CoroutineScope(SupervisorJob() + Dispatchers.Main)
    }

    // HomeViewModel - Factory (new instance per screen)
    factory {
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
        SiteDetailViewModel(
            siteId = params.get(),
            repository = get(),
            toggleFavoriteUseCase = get(),
            coroutineScope = get()
        )
    }

    // DetailViewModel - Factory with parameter
    // Use parametersOf() for siteId
    factory { params ->
        DetailViewModel(
            siteId = params.get(),
            getSitesUseCase = get(),
            wallpaperService = get(),
            coroutineScope = get()
        )
    }
}
