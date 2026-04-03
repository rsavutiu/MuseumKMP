package com.museum.presentation.screens.home

import androidx.compose.foundation.layout.padding
import androidx.compose.material3.Icon
import androidx.compose.material3.NavigationDrawerItem
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import com.whitelabel.core.presentation.home.ViewMode
import com.whitelabel.platform.presentation.screens.home.CatalogNavigationDrawer
import com.whitelabel.platform.presentation.screens.home.DrawerMenuItem
import museumkmp.shared.generated.resources.Res
import museumkmp.shared.generated.resources.grid_view
import museumkmp.shared.generated.resources.language
import museumkmp.shared.generated.resources.map
import org.jetbrains.compose.resources.DrawableResource
import org.jetbrains.compose.resources.ExperimentalResourceApi
import org.jetbrains.compose.resources.painterResource

@OptIn(ExperimentalResourceApi::class)
@Composable
fun HomeDrawerContent(
    viewMode: ViewMode,
    onViewModeChange: (ViewMode) -> Unit,
    onLanguageClick: () -> Unit,
    onCloseDrawer: () -> Unit,
    modifier: Modifier = Modifier
) {
    val menuItems = listOf(
        DrawerMenuItem(
            label = "Grid View",
            icon = Res.drawable.grid_view,
            viewMode = ViewMode.Grid
        ),
        DrawerMenuItem(
            label = "Map View",
            icon = Res.drawable.map,
            viewMode = ViewMode.Map
        ),
        DrawerMenuItem(
            label = "Language",
            icon = Res.drawable.language,
            isAction = true,
            onClick = onLanguageClick
        )
    )

    CatalogNavigationDrawer(
        currentViewMode = viewMode,
        onViewModeChange = onViewModeChange,
        menuItems = menuItems,
        headerTitle = "View Options",
        onCloseDrawer = onCloseDrawer,
        modifier = modifier,
        itemContent = { item, isSelected, onClick ->
            val iconRes = item.icon as? DrawableResource
            NavigationDrawerItem(
                label = { Text(item.label) },
                icon = iconRes?.let { res ->
                    { Icon(painterResource(res), contentDescription = item.label) }
                },
                selected = isSelected,
                onClick = onClick,
                modifier = Modifier.padding(horizontal = 12.dp, vertical = 4.dp)
            )
        }
    )
}
