package com.museum.presentation.components

import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import com.museum.data.models.HeritageSite
import com.museum.presentation.screens.map.MapScreen

/**
 * Android implementation using Google Maps
 */
@Composable
actual fun MapView(
    sites: List<HeritageSite>,
    onSiteClick: (Long) -> Unit,
    modifier: Modifier
) {
    MapScreen(
        sites = sites,
        onSiteClick = onSiteClick,
        modifier = modifier
    )
}
