package com.museum.presentation.screens.home

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.PaddingValues
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.lazy.grid.GridCells
import androidx.compose.foundation.lazy.grid.GridItemSpan
import androidx.compose.foundation.lazy.grid.LazyVerticalGrid
import androidx.compose.foundation.lazy.grid.items
import androidx.compose.foundation.lazy.grid.rememberLazyGridState
import androidx.compose.material3.Text
import androidx.compose.material3.MaterialTheme
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import coil3.compose.LocalPlatformContext
import coil3.SingletonImageLoader
import com.museum.data.models.HeritageSite
import com.museum.presentation.components.EmptyState
import com.museum.presentation.components.LoadingIndicator
import com.museum.presentation.components.MapView
import com.museum.presentation.components.SiteCard
import com.museum.utils.ImagePreloader

@Composable
fun HomeContent(
    uiState: HomeUiState,
    viewMode: ViewMode,
    searchQuery: String,
    onSiteClick: (Long) -> Unit,
    onFavoriteClick: (HeritageSite) -> Unit,
    modifier: Modifier = Modifier
) {
    when (uiState) {
        is HomeUiState.Loading -> LoadingIndicator()
        is HomeUiState.Empty -> EmptyState(
            message = if (searchQuery.isBlank()) "No sites found" else "No results"
        )
        is HomeUiState.Success -> {
            // Set up image preloader
            val context = LocalPlatformContext.current
            val imageLoader = SingletonImageLoader.get(context)
            val imagePreloader = remember(imageLoader) { ImagePreloader(context, imageLoader) }
            val gridState = rememberLazyGridState()

            // Track if initial preload is complete
            var initialPreloadComplete by remember { mutableStateOf(false) }

            // Initial preload - preload first batch BEFORE showing grid
            LaunchedEffect(uiState.sites) {
                // Preload visible items FIRST (critical for initial display)
                imagePreloader.preloadImages(
                    sites = uiState.sites,
                    currentIndex = 0,
                    preloadCount = 12 // First 12 items (6 rows, what's visible on screen)
                )
                initialPreloadComplete = true // Mark as complete

                // Then preload ahead for smooth scrolling (in background)
                imagePreloader.preloadImages(
                    sites = uiState.sites,
                    currentIndex = 12,
                    preloadCount = 30 // Next 30 items
                )
            }
            // Show loading until initial preload completes, otherwise show content
            if (!initialPreloadComplete) {
                LoadingIndicator()
            } else {
                // Continuous preload - stay ahead as user scrolls
                LaunchedEffect(gridState.firstVisibleItemIndex) {
                    if (gridState.firstVisibleItemIndex > 0) { // Skip initial trigger
                        val currentIndex = gridState.firstVisibleItemIndex
                        // Preload from current position FORWARD (ahead of scroll)
                        imagePreloader.preloadImages(
                            sites = uiState.sites,
                            currentIndex = currentIndex + 12, // Start preloading ahead of visible
                            preloadCount = 40 // Preload 40 items ahead
                        )
                    }
                }

                when (viewMode) {
                    ViewMode.Grid -> {
                        LazyVerticalGrid(
                            state = gridState,
                            modifier = modifier,
                            columns = GridCells.Fixed(2),
                            contentPadding = PaddingValues(16.dp),
                            horizontalArrangement = Arrangement.spacedBy(12.dp),
                            verticalArrangement = Arrangement.spacedBy(12.dp)
                        ) {
                            item(span = { GridItemSpan(maxLineSpan) }) {
                                Text(
                                    text = "${uiState.sites.size} World Heritage Sites",
                                    style = MaterialTheme.typography.titleMedium,
                                    modifier = Modifier.padding(bottom = 8.dp)
                                )
                            }
                            items(items = uiState.sites, key = { "${it.id}_${it.name}" }) { site ->
                                val onFavorite = remember(site) {
                                    { onFavoriteClick(site) }
                                }
                                SiteCard(
                                    site = site,
                                    onClick = { onSiteClick(site.id) },
                                    onFavoriteClick = onFavorite
                                )
                            }
                        }
                    }
                    ViewMode.Map -> {
                        MapView(sites = uiState.sites, onSiteClick = onSiteClick, modifier = modifier)
                    }
                }
            }
        }
        is HomeUiState.Error -> EmptyState(message = uiState.message)
    }
}
