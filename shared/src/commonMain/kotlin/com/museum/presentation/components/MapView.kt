package com.museum.presentation.components

import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import com.museum.data.models.HeritageSite

/**
 * Expect composable for platform-specific map view
 */
@Composable
expect fun MapView(
    sites: List<HeritageSite>,
    onSiteClick: (Long) -> Unit,
    modifier: Modifier = Modifier
)
