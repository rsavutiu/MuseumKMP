package com.museum.android

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Surface
import androidx.compose.runtime.remember
import androidx.compose.runtime.rememberCoroutineScope
import androidx.compose.ui.Modifier
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import androidx.navigation.compose.rememberNavController
import com.museum.presentation.screens.home.HomeScreen
import com.museum.presentation.screens.home.HomeViewModel
import com.museum.presentation.theme.MuseumTheme

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        
        val appModule = (application as MuseumApplication).appModule
        
        setContent {
            MuseumTheme {
                Surface(
                    modifier = Modifier.fillMaxSize(),
                    color = MaterialTheme.colorScheme.background
                ) {
                    val navController = rememberNavController()
                    val coroutineScope = rememberCoroutineScope()
                    
                    NavHost(navController = navController, startDestination = "home") {
                        composable("home") {
                            val viewModel = remember {
                                HomeViewModel(
                                    getArtworksUseCase = appModule.getArtworksUseCase,
                                    searchArtworkUseCase = appModule.searchArtworkUseCase,
                                    toggleFavoriteUseCase = appModule.toggleFavoriteUseCase,
                                    coroutineScope = coroutineScope
                                )
                            }
                            HomeScreen(
                                viewModel = viewModel,
                                onArtworkClick = { /* Navigate to detail */ }
                            )
                        }
                    }
                }
            }
        }
    }
}
