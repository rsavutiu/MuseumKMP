package com.museum.presentation.screens.map

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.remember
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import com.google.android.gms.maps.model.CameraPosition
import com.google.android.gms.maps.model.LatLng
import com.google.maps.android.clustering.ClusterItem
import com.google.maps.android.clustering.algo.GridBasedAlgorithm
import com.google.maps.android.compose.GoogleMap
import com.google.maps.android.compose.clustering.Clustering
import com.google.maps.android.compose.MapProperties
import com.google.maps.android.compose.MapUiSettings
import com.google.maps.android.compose.MapsComposeExperimentalApi
import com.google.maps.android.compose.clustering.rememberClusterManager
import com.google.maps.android.compose.rememberCameraPositionState
import com.museum.data.models.HeritageSite

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

        GoogleMap(
            modifier = modifier.fillMaxSize(),
            cameraPositionState = cameraPositionState,
            properties = MapProperties(isMyLocationEnabled = false, minZoomPreference = 4.0f),
            uiSettings = MapUiSettings(
                zoomControlsEnabled = true,
                myLocationButtonEnabled = false,
                scrollGesturesEnabled = true,
                zoomGesturesEnabled = true,
                rotationGesturesEnabled = true,
                tiltGesturesEnabled = true
            )
        ) {
            val clusterManager = rememberClusterManager<SiteClusterItem>()

            LaunchedEffect(clusterManager) {
                clusterManager?.let {
                    it.algorithm = GridBasedAlgorithm()
                    it.setOnClusterClickListener { cluster ->
                        // Return false to allow the default behavior (zoom into cluster)
                        false
                    }
                    it.setOnClusterItemInfoWindowClickListener { item ->
                        onSiteClick(item.site.id)
                    }
                }
            }

            val clusterItems = remember(sitesWithCoordinates) {
                sitesWithCoordinates.map { SiteClusterItem(it) }
            }

            clusterManager?.let { manager ->
                Clustering(
                    items = clusterItems,
                    clusterManager = manager,
                )
            }
        }
    }
}
