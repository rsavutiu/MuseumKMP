package com.museum.presentation.screens.home

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.PaddingValues
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.lazy.grid.GridCells
import androidx.compose.foundation.lazy.grid.GridItemSpan
import androidx.compose.foundation.lazy.grid.LazyVerticalGrid
import androidx.compose.foundation.lazy.grid.items
import androidx.compose.foundation.lazy.grid.rememberLazyGridState
import androidx.compose.material3.HorizontalDivider
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.alpha
import androidx.compose.ui.unit.dp
import coil3.SingletonImageLoader
import coil3.compose.LocalPlatformContext
import com.museum.data.models.CountrySiteGroup
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
        is HomeUiState.Error -> EmptyState(message = uiState.message)
        is HomeUiState.Success -> {
            // Only compose the active view to avoid memory issues
            when (viewMode) {
                ViewMode.Map -> {
                    MapView(
                        sites = uiState.sites,
                        onSiteClick = onSiteClick,
                        modifier = modifier.fillMaxSize()
                    )
                }
                ViewMode.Grid -> {
                    GridViewWithPreloading(
                        sites = uiState.sites,
                        groupedSites = uiState.groupedSites,
                        onSiteClick = onSiteClick,
                        onFavoriteClick = onFavoriteClick,
                        modifier = modifier.fillMaxSize()
                    )
                }
            }
        }
    }
}

@Composable
private fun GridViewWithPreloading(
    sites: List<HeritageSite>,
    groupedSites: List<CountrySiteGroup>,
    onSiteClick: (Long) -> Unit,
    onFavoriteClick: (HeritageSite) -> Unit,
    modifier: Modifier = Modifier
) {
    val context = LocalPlatformContext.current
    val imageLoader = SingletonImageLoader.get(context)
    val imagePreloader = remember(imageLoader) { ImagePreloader(context, imageLoader) }
    val gridState = rememberLazyGridState()
    var initialPreloadComplete by remember { mutableStateOf(false) }

    LaunchedEffect(sites) {
        imagePreloader.preloadImages(
            sites = sites,
            currentIndex = 0,
            preloadCount = 12
        )
        initialPreloadComplete = true

        imagePreloader.preloadImages(
            sites = sites,
            currentIndex = 12,
            preloadCount = 30
        )
    }

    if (!initialPreloadComplete) {
        LoadingIndicator()
    } else {
        LaunchedEffect(gridState.firstVisibleItemIndex) {
            if (gridState.firstVisibleItemIndex > 0) {
                val currentIndex = gridState.firstVisibleItemIndex
                imagePreloader.preloadImages(
                    sites = sites,
                    currentIndex = currentIndex + 12,
                    preloadCount = 40
                )
            }
        }

        LazyVerticalGrid(
            state = gridState,
            modifier = modifier,
            columns = GridCells.Fixed(2),
            contentPadding = PaddingValues(16.dp),
            horizontalArrangement = Arrangement.spacedBy(12.dp),
            verticalArrangement = Arrangement.spacedBy(12.dp)
        ) {
            val totalEntries = groupedSites.sumOf { it.sites.size }
            item(span = { GridItemSpan(maxLineSpan) }) {
                Text(
                    text = "$totalEntries Heritage Sites (${sites.size} unique sites in ${groupedSites.size} countries)",
                    style = MaterialTheme.typography.titleMedium,
                    modifier = Modifier.padding(bottom = 8.dp)
                )
            }

            groupedSites.forEach { group ->
                // Country header with divider
                item(span = { GridItemSpan(maxLineSpan) }) {
                    Column(
                        modifier = Modifier.fillMaxWidth()
                    ) {
                        Text(
                            text = "${group.country.getLocalizedName()} (${group.sites.size})",
                            style = MaterialTheme.typography.headlineSmall,
                            color = MaterialTheme.colorScheme.primary,
                            modifier = Modifier.padding(top = 16.dp, bottom = 8.dp)
                        )
                        HorizontalDivider(
                            modifier = Modifier.fillMaxWidth(),
                            thickness = 1.dp,
                            color = MaterialTheme.colorScheme.primary
                        )
                    }
                }

                // Sites for this country
                items(items = group.sites, key = { "${it.id}_${it.name}_${group.country.name}" }) { site ->
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
    }
}
