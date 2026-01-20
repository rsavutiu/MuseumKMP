package com.museum.presentation.screens.home

import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import museumkmp.shared.generated.resources.Res
import museumkmp.shared.generated.resources.map
import museumkmp.shared.generated.resources.grid_view
import museumkmp.shared.generated.resources.language
import org.jetbrains.compose.resources.ExperimentalResourceApi
import org.jetbrains.compose.resources.painterResource

@OptIn(ExperimentalResourceApi::class)
@Composable
fun HomeDrawerContent(
    viewMode: ViewMode,
    onViewModeChange: (ViewMode) -> Unit,
    onLanguageClick: () -> Unit,
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
        Spacer(modifier = Modifier.height(8.dp))

        NavigationDrawerItem(
            label = { Text("Grid View") },
            icon = { Icon(painterResource(Res.drawable.grid_view), contentDescription = "Grid View") },
            selected = viewMode == ViewMode.Grid,
            onClick = {
                onViewModeChange(ViewMode.Grid)
                onCloseDrawer()
            },
            modifier = Modifier.padding(horizontal = 12.dp, vertical = 4.dp)
        )
        HorizontalDivider(modifier = Modifier.padding(horizontal = 16.dp))
        NavigationDrawerItem(
            label = { Text("Map View") },
            icon = { Icon(painterResource(Res.drawable.map), contentDescription = "Map View") },
            selected = viewMode == ViewMode.Map,
            onClick = {
                onViewModeChange(ViewMode.Map)
                onCloseDrawer()
            },
            modifier = Modifier.padding(horizontal = 12.dp, vertical = 4.dp)
        )
        HorizontalDivider(modifier = Modifier.padding(horizontal = 16.dp))
        NavigationDrawerItem(
            label = { Text("Language") },
            icon = { Icon(painterResource(resource = Res.drawable.language), contentDescription = "Language") },
            selected = false,
            onClick = {
                onLanguageClick()
                onCloseDrawer()
            },
            modifier = Modifier.padding(horizontal = 12.dp, vertical = 4.dp)
        )
        Spacer(modifier = Modifier.height(8.dp))
    }
}
