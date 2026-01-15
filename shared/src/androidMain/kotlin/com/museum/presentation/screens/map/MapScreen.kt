package com.museum.presentation.screens.map

import androidx.compose.foundation.BorderStroke
import androidx.compose.foundation.Image
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.Card
import androidx.compose.material3.CardDefaults
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.draw.clip
import androidx.compose.ui.draw.shadow
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.unit.dp
import coil3.compose.AsyncImage
import coil3.compose.LocalPlatformContext
import coil3.request.ImageRequest
import com.google.android.gms.maps.model.BitmapDescriptor
import com.google.android.gms.maps.model.BitmapDescriptorFactory
import com.google.android.gms.maps.model.CameraPosition
import com.google.android.gms.maps.model.LatLng
import com.google.maps.android.clustering.ClusterItem
import com.google.maps.android.clustering.algo.GridBasedAlgorithm
import com.google.maps.android.compose.GoogleMap
import com.google.maps.android.compose.MapProperties
import com.google.maps.android.compose.MapUiSettings
import com.google.maps.android.compose.Marker
import com.google.maps.android.compose.MarkerInfoWindow
import com.google.maps.android.compose.MarkerState
import com.google.maps.android.compose.rememberMarkerState
import com.google.maps.android.compose.MapsComposeExperimentalApi
import com.google.maps.android.compose.clustering.Clustering
import com.google.maps.android.compose.rememberCameraPositionState
import com.google.maps.android.compose.clustering.rememberClusterManager
import com.museum.data.models.HeritageSite
import com.museum.utils.getDrawableResourceId
import com.museum.utils.toDrawableResourceName


@OptIn(MapsComposeExperimentalApi::class)
@Composable
fun MapScreen(
    sites: List<HeritageSite>,
    onSiteClick: (Long) -> Unit,
    modifier: Modifier = Modifier
) {
    val sitesWithCoordinates = remember(sites) {
        sites.filter { it.latitude != null && it.longitude != null }
    }

    if (sitesWithCoordinates.isEmpty()) {
        Box(
            modifier = modifier.fillMaxSize(),
            contentAlignment = Alignment.Center
        ) {
            Column(
                horizontalAlignment = Alignment.CenterHorizontally,
                verticalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                Text(
                    text = "Map view requires location data",
                    style = MaterialTheme.typography.titleMedium
                )
                Text(
                    text = "${sites.size} sites available, but no coordinates yet",
                    style = MaterialTheme.typography.bodyMedium,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
        }
    } else {
        val cameraPositionState = rememberCameraPositionState {
            val centerLat = sitesWithCoordinates.map { it.latitude!! }.average()
            val centerLng = sitesWithCoordinates.map { it.longitude!! }.average()
            position = CameraPosition.fromLatLngZoom(LatLng(centerLat, centerLng), 2f)
        }

        var selectedSite by remember { mutableStateOf<HeritageSite?>(null) }
        val currentZoom = cameraPositionState.position.zoom
        val showThumbnails = currentZoom >= 12f

        /*

        GoogleMap(
            modifier = modifier.fillMaxSize(),
            cameraPositionState = cameraPositionState,
            properties = MapProperties(isMyLocationEnabled = false, minZoomPreference = 4.0f),
            uiSettings = MapUiSettings(zoomControlsEnabled = true, myLocationButtonEnabled = false)
        ) {
            val context = LocalContext.current
            val clusterManager = rememberClusterManager<SiteClusterItem>()

            // Configure the cluster manager and its algorithm in a LaunchedEffect
            LaunchedEffect(clusterManager) {
                clusterManager?.let {
                    it.algorithm = GridBasedAlgorithm()
                    it.setOnClusterClickListener { false }
                    it.setOnClusterItemClickListener { item ->
                        onSiteClick(item.site.id)
                        true
                    }
                }
            }

            val clusterItems = remember(sitesWithCoordinates) {
                sitesWithCoordinates.map { SiteClusterItem(it) }
            }
            clusterManager?.let { it ->
            Clustering(
                items = clusterItems,
                clusterManager = it,
            )}
        }

         */



        GoogleMap(
            modifier = modifier.fillMaxSize(),
            cameraPositionState = cameraPositionState,
            properties = MapProperties(isMyLocationEnabled = false, minZoomPreference = 4.0f),
            uiSettings = MapUiSettings(zoomControlsEnabled = true, myLocationButtonEnabled = false)
        ) {
            sitesWithCoordinates.forEach { site ->
                val position = LatLng(site.latitude!!, site.longitude!!)

                if (showThumbnails) {
                    // High zoom: show thumbnail images, click goes directly to detail
                    MarkerInfoWindow(
                        state = rememberMarkerState(position = position),
                        onClick = {
                            onSiteClick(site.id)
                            true
                        }
                    ) {
                        SiteThumbnailMarker(site)
                    }
                } else {
                    // Low zoom: show pins with info window
                    MarkerInfoWindow(
                        state = rememberMarkerState(position = position),
                        onClick = {
                            selectedSite = if (selectedSite?.id == site.id) null else site
                            false
                        }
                    ) {
                        if (selectedSite?.id == site.id) {
                            SiteInfoWindow(
                                site = site,
                                onClick = { onSiteClick(site.id) }
                            )
                        }
                    }
                }
            }
        }
    }
}

data class SiteClusterItem(
    val site: HeritageSite,
    private val latLng: LatLng = LatLng(site.latitude!!, site.longitude!!),
    private val title: String = site.name,
    private val snippet: String = site.location ?: ""
) : ClusterItem {
    override fun getPosition(): LatLng = latLng
    override fun getTitle(): String = title
    override fun getSnippet(): String = snippet
    override fun getZIndex(): Float? {
        return if (site.latitude != null && site.longitude != null) 1f else null
    }
}

@Composable
private fun SiteThumbnailMarker(site: HeritageSite) {
    val context = LocalPlatformContext.current
    val resourceName = site.name.toDrawableResourceName()
    val drawableId = getDrawableResourceId(resourceName)
    val imageUrl = site.imageUrl?.split(",")?.firstOrNull()?.trim()
    val imageModel = if (drawableId != 0) drawableId else imageUrl

    Card(
        modifier = Modifier
            .size(80.dp)
            .shadow(4.dp, RoundedCornerShape(8.dp)),
        shape = RoundedCornerShape(8.dp),
        border = BorderStroke(2.dp, Color.White)
    ) {
        AsyncImage(
            model = ImageRequest.Builder(context).data(imageModel).build(),
            contentDescription = site.getLocalizedName(),
            modifier = Modifier.fillMaxSize(),
            contentScale = ContentScale.Crop
        )
    }
}

@Composable
private fun SiteInfoWindow(
    site: HeritageSite,
    onClick: () -> Unit
) {
    val context = LocalPlatformContext.current
    val resourceName = site.name.toDrawableResourceName()
    val drawableId = getDrawableResourceId(resourceName)
    val imageUrl = site.imageUrl?.split(",")?.firstOrNull()?.trim()
    val imageModel = if (drawableId != 0) drawableId else imageUrl

    Card(
        modifier = Modifier
            .width(200.dp)
            .clickable { onClick() }
            .shadow(8.dp, RoundedCornerShape(12.dp)),
        shape = RoundedCornerShape(12.dp),
        colors = CardDefaults.cardColors(containerColor = Color.White)
    ) {
        Column(
            modifier = Modifier.padding(12.dp)
        ) {
            AsyncImage(
                model = ImageRequest.Builder(context).data(imageModel).build(),
                contentDescription = site.getLocalizedName(),
                modifier = Modifier
                    .fillMaxSize()
                    .height(100.dp)
                    .clip(RoundedCornerShape(8.dp)),
                contentScale = ContentScale.Crop
            )

            Spacer(modifier = Modifier.height(8.dp))

            Text(
                text = site.getLocalizedName(),
                style = MaterialTheme.typography.titleMedium,
                color = Color.Black,
                maxLines = 2
            )

            site.location?.let { location ->
                Spacer(modifier = Modifier.height(4.dp))
                Text(
                    text = location,
                    style = MaterialTheme.typography.bodySmall,
                    color = Color.Gray,
                    maxLines = 1
                )
            }
        }
    }
}

