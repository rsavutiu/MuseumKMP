package com.museum.android

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.material3.*
import androidx.compose.ui.Modifier
import org.koin.compose.koinInject
import org.koin.core.parameter.parametersOf
import androidx.navigation.NavType
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import androidx.navigation.compose.rememberNavController
import androidx.navigation.navArgument
import com.museum.presentation.screens.detail.DetailScreen
import com.museum.presentation.screens.detail.DetailViewModel
import com.museum.presentation.screens.home.HomeScreen
import com.museum.presentation.screens.home.HomeViewModel
import com.museum.presentation.screens.site.SiteDetailScreen
import com.museum.presentation.screens.site.SiteDetailViewModel
import com.museum.presentation.theme.MuseumTheme

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        setContent {
            MuseumTheme {
                Surface(
                    modifier = Modifier.fillMaxSize(),
                    color = MaterialTheme.colorScheme.background
                ) {
                    val navController = rememberNavController()

                    NavHost(navController = navController, startDestination = "home") {
                        composable("home") {
                            val viewModel: HomeViewModel = koinInject()
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

                            val viewModel: SiteDetailViewModel = koinInject { parametersOf(siteId) }

                            SiteDetailScreen(
                                viewModel = viewModel,
                                onBackClick = { navController.popBackStack() },
                                onShowFullImage = { siteId ->
                                    navController.navigate("detail/$siteId")
                                }
                            )
                        }

                        composable(
                            route = "detail/{siteId}",
                            arguments = listOf(navArgument("siteId") { type = NavType.LongType })
                        ) { backStackEntry ->
                            val siteId = backStackEntry.arguments?.getLong("siteId") ?: return@composable

                            val viewModel: DetailViewModel = koinInject { parametersOf(siteId) }

                            DetailScreen(
                                viewModel = viewModel,
                                onNavigateBack = { navController.popBackStack() }
                            )
                        }
                    }
                }
            }
        }
    }
}
