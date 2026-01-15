package com.museum.android

import androidx.compose.runtime.Composable
import androidx.compose.runtime.remember
import androidx.navigation.NavType
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import androidx.navigation.compose.rememberNavController
import androidx.navigation.navArgument
import androidx.navigation.navigation
import com.museum.presentation.screens.detail.DetailScreen
import com.museum.presentation.screens.detail.DetailViewModel
import com.museum.presentation.screens.home.HomeScreen
import com.museum.presentation.screens.home.HomeViewModel
import com.museum.presentation.screens.site.SiteDetailScreen
import com.museum.presentation.screens.site.SiteDetailViewModel
import com.museum.utils.LOG
import org.koin.androidx.compose.koinViewModel
import org.koin.core.parameter.parametersOf

@Composable
fun AppNavigation() {
    val navController = rememberNavController()

    NavHost(navController = navController, startDestination = "main_graph") {
        navigation(startDestination = "home", route = "main_graph") {
            composable("home") {
                val parentEntry = remember(navController.currentBackStackEntry) {
                    navController.getBackStackEntry("main_graph")
                }
                val viewModel: HomeViewModel = koinViewModel(viewModelStoreOwner = parentEntry)
                LOG("HomeViewModel: $viewModel")
                HomeScreen(
                    viewModel = viewModel,
                    onSiteClick = { siteId -> navController.navigate("site/$siteId") }
                )
            }

            composable(
                route = "site/{siteId}",
                arguments = listOf(navArgument("siteId") { type = NavType.LongType })
            ) { backStackEntry ->
                val siteId = backStackEntry.arguments?.getLong("siteId") ?: return@composable
                val viewModel: SiteDetailViewModel = koinViewModel { parametersOf(siteId) }

                SiteDetailScreen(
                    viewModel = viewModel,
                    onBackClick = { navController.popBackStack() },
                    onShowFullImage = { id -> navController.navigate("detail/$id") }
                )
            }

            composable(
                route = "detail/{siteId}",
                arguments = listOf(navArgument("siteId") { type = NavType.LongType })
            ) { backStackEntry ->
                val siteId = backStackEntry.arguments?.getLong("siteId") ?: return@composable
                val viewModel: DetailViewModel = koinViewModel { parametersOf(siteId) }

                DetailScreen(
                    viewModel = viewModel,
                    onNavigateBack = { navController.popBackStack() }
                )
            }
        }
    }
}
