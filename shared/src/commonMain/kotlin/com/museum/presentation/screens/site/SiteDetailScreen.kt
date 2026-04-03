package com.museum.presentation.screens.site

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.LocationOn
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.unit.dp
import coil3.compose.AsyncImage
import coil3.compose.LocalPlatformContext
import coil3.request.ImageRequest
import com.museum.data.models.HeritageSite
import com.museum.utils.LOG
import com.museum.utils.getDrawableResourceId
import com.museum.utils.getPrimaryColor
import com.museum.utils.toDrawableResourceName
import com.whitelabel.platform.presentation.screens.detail.GenericDetailScreen
import museumkmp.shared.generated.resources.Res
import museumkmp.shared.generated.resources.fullscreen
import museumkmp.shared.generated.resources.map
import org.jetbrains.compose.resources.ExperimentalResourceApi
import org.jetbrains.compose.resources.painterResource

@OptIn(ExperimentalResourceApi::class)
@Composable
fun SiteDetailScreen(
    viewModel: SiteDetailViewModel,
    onBackClick: () -> Unit,
    onShowFullImage: (Long) -> Unit,
    onShowOnMap: (Long) -> Unit
) {
    GenericDetailScreen(
        viewModel = viewModel,
        onBackClick = onBackClick,
        languageCode = "en", // TODO: Get from language provider
        topBarColor = Color(0xFF1976D2), // Use a default primary color
        topBarContentColor = Color.White,
        floatingActionButton = { site ->
            Column(
                modifier = Modifier.padding(16.dp),
                verticalArrangement = Arrangement.spacedBy(12.dp),
                horizontalAlignment = Alignment.End
            ) {
                if (site.latitude != null && site.longitude != null) {
                    SmallFloatingActionButton(
                        onClick = { onShowOnMap(site.id) }
                    ) {
                        Icon(
                            painter = painterResource(Res.drawable.map),
                            contentDescription = "Show on Map"
                        )
                    }
                }
                FloatingActionButton(
                    onClick = { onShowFullImage(site.id) }
                ) {
                    Icon(
                        painter = painterResource(Res.drawable.fullscreen),
                        contentDescription = "View Fullscreen"
                    )
                }
            }
        },
        content = { site, localizedGroupName ->
            SiteDetailContent(
                site = site,
                localizedCountries = localizedGroupName ?: ""
            )
        }
    )
}

@Composable
private fun SiteDetailContent(
    site: HeritageSite,
    localizedCountries: String,
    modifier: Modifier = Modifier
) {
    Column(
        modifier = modifier
            .fillMaxSize()
            .verticalScroll(rememberScrollState())
            .padding(16.dp)
    ) {
        val context = LocalPlatformContext.current
        val resourceName = site.name.toDrawableResourceName()
        val drawableId = getDrawableResourceId(resourceName)
        val imageUrl = site.imageUrl?.split(",")?.firstOrNull()?.trim()
        val imageModel = if (drawableId != 0) drawableId else imageUrl
        if (drawableId == 0) {
            LOG("ERROR WE COULD NOT FIND DRAWABLE ID FOR $resourceName  from ${site.name}")
        }

        if (imageModel != null) {
            AsyncImage(
                model = ImageRequest.Builder(context).data(imageModel).build(),
                contentDescription = site.getLocalizedName(),
                modifier = Modifier
                    .fillMaxWidth()
                    .height(200.dp)
                    .clip(RoundedCornerShape(8.dp)),
                contentScale = ContentScale.Crop
            )
            Spacer(modifier = Modifier.height(16.dp))
        }

        site.location?.let {
            Row(verticalAlignment = Alignment.CenterVertically) {
                Icon(
                    Icons.Default.LocationOn,
                    contentDescription = null,
                    modifier = Modifier.size(20.dp),
                    tint = MaterialTheme.colorScheme.primary
                )
                Spacer(Modifier.width(8.dp))
                Text(
                    text = it,
                    style = MaterialTheme.typography.bodyLarge,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
            Spacer(modifier = Modifier.height(8.dp))
        }

        if (localizedCountries.isNotBlank()) {
            Text(
                text = localizedCountries,
                style = MaterialTheme.typography.bodyMedium,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
            Spacer(modifier = Modifier.height(8.dp))
        }

        Spacer(modifier = Modifier.height(8.dp))
        HorizontalDivider()
        Spacer(modifier = Modifier.height(16.dp))

        site.getLocalizedDescription()?.let { description ->
            if (description.isNotBlank()) {
                Text(
                    text = description,
                    style = MaterialTheme.typography.bodyLarge,
                    color = MaterialTheme.colorScheme.onSurface
                )
            }
        } ?: Text(
            text = "No description available",
            style = MaterialTheme.typography.bodyLarge,
            color = MaterialTheme.colorScheme.onSurfaceVariant
        )
    }
}
