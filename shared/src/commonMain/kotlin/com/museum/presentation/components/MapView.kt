package com.museum.presentation.components

import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import com.museum.data.models.HeritageSite
import com.whitelabel.platform.presentation.components.MapView as PlatformMapView

/**
 * Re-export MapView from whitelabel-platform for HeritageSite
 */
@Composable
fun MapView(
    sites: List<HeritageSite>,
    focusedSiteId: Long? = null,
    onSiteClick: (Long) -> Unit,
    onClearFocusedSite: () -> Unit = {},
    modifier: Modifier = Modifier
) {
    PlatformMapView(
        items = sites,
        focusedItemId = focusedSiteId,
        onItemClick = onSiteClick,
        onClearFocusedItem = onClearFocusedSite,
        modifier = modifier
    )
}
