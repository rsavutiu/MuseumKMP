package com.museum.presentation.screens.home

import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.HorizontalDivider
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import com.museum.data.models.HeritageSite
import com.museum.presentation.components.SiteCard
import com.whitelabel.core.presentation.home.HomeUiState
import com.whitelabel.core.presentation.home.ViewMode
import com.whitelabel.platform.presentation.screens.home.HomeContent as PlatformHomeContent

/**
 * Museum-specific HomeContent that delegates to whitelabel-platform version
 * with museum-specific components.
 */
@Composable
fun HomeContent(
    uiState: HomeUiState,
    viewMode: ViewMode,
    searchQuery: String,
    focusedSiteId: Long? = null,
    onSiteClick: (Long) -> Unit,
    onFavoriteClick: (HeritageSite) -> Unit,
    onClearFocusedSite: () -> Unit = {},
    modifier: Modifier = Modifier
) {
    PlatformHomeContent(
        uiState = uiState,
        viewMode = viewMode,
        languageCode = getCurrentLanguageCode(),
        searchQuery = searchQuery,
        focusedItemId = focusedSiteId,
        onItemClick = onSiteClick,
        onFavoriteClick = onFavoriteClick,
        onClearFocusedItem = onClearFocusedSite,
        modifier = modifier,
        gridColumns = 2,
        listHeader = {
            if (uiState is HomeUiState.Success<*>) {
                @Suppress("UNCHECKED_CAST")
                val successState = uiState as HomeUiState.Success<HeritageSite>
                val totalEntries = successState.groups.sumOf { it.items.size }
                Text(
                    text = "$totalEntries Heritage Sites (${successState.items.size} unique sites in ${successState.groups.size} countries)",
                    style = MaterialTheme.typography.titleMedium,
                    modifier = Modifier.padding(bottom = 8.dp)
                )
            }
        },
        groupHeader = { group ->
            Column(modifier = Modifier.fillMaxWidth()) {
                Text(
                    text = "${group.displayName} (${group.items.size})",
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
    )
}

// Helper function to get current language code
@Composable
private fun getCurrentLanguageCode(): String {
    // This should be replaced with actual language provider implementation
    return "en"
}
