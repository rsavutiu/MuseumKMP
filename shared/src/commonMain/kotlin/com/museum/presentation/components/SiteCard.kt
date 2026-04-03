package com.museum.presentation.components

import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.unit.dp
import com.museum.data.models.HeritageSite
import com.museum.utils.getCardBackgroundColor
import com.whitelabel.platform.presentation.components.GenericSiteCard

/**
 * Museum-specific SiteCard that uses GenericSiteCard from whitelabel-platform
 * with museum-specific theming and image loading.
 */
@Composable
fun SiteCard(
    site: HeritageSite,
    onClick: () -> Unit,
    onFavoriteClick: () -> Unit,
    modifier: Modifier = Modifier
) {
    val imageUrl = site.imageUrl?.split(",")?.firstOrNull()?.trim()
    
    GenericSiteCard(
        item = site,
        languageCode = "en", // Uses LanguagePreferences internally via getLocalizedName()
        onClick = onClick,
        onFavoriteClick = onFavoriteClick,
        modifier = modifier,
        imageUrl = imageUrl,
        imageHeight = 120.dp,
        cardColors = androidx.compose.material3.CardDefaults.cardColors(
            containerColor = site.getCardBackgroundColor()
        ),
        showFavorite = true,
        titleColor = Color.White
    )
}
