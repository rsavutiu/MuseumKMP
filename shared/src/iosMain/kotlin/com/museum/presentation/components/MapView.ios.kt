package com.museum.presentation.components

import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import com.museum.data.models.HeritageSite

/**
 * iOS implementation (placeholder - MapKit integration needed)
 */
@Composable
actual fun MapView(
    sites: List<HeritageSite>,
    onSiteClick: (Long) -> Unit,
    modifier: Modifier
) {
    Box(
        modifier = modifier.fillMaxSize(),
        contentAlignment = Alignment.Center
    ) {
        Text(
            text = "Map view not yet implemented for iOS\n\n${sites.size} sites available",
            style = MaterialTheme.typography.bodyLarge
        )
    }
}
