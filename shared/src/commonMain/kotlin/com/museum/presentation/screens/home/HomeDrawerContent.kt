package com.museum.presentation.screens.home

import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp

@Composable
fun HomeDrawerContent(
    viewMode: ViewMode,
    onViewModeChange: (ViewMode) -> Unit,
    onCloseDrawer: () -> Unit
) {
    ModalDrawerSheet {
        Spacer(modifier = Modifier.height(16.dp))
        Text(
            text = "View Options",
            style = MaterialTheme.typography.headlineSmall,
            modifier = Modifier.padding(16.dp)
        )
        HorizontalDivider()
        NavigationDrawerItem(
            label = { Text("Grid View") },
            selected = viewMode == ViewMode.Grid,
            onClick = {
                onViewModeChange(ViewMode.Grid)
                onCloseDrawer()
            },
            modifier = Modifier.padding(horizontal = 12.dp)
        )
        NavigationDrawerItem(
            label = { Text("Map View") },
            selected = viewMode == ViewMode.Map,
            onClick = {
                onViewModeChange(ViewMode.Map)
                onCloseDrawer()
            },
            modifier = Modifier.padding(horizontal = 12.dp)
        )
    }
}
