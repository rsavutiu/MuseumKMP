package com.museum.presentation.screens.detail

import androidx.compose.foundation.background
import androidx.compose.foundation.gestures.detectTransformGestures

import androidx.compose.foundation.layout.*
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.ArrowBack
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.geometry.Offset
import androidx.compose.ui.graphics.graphicsLayer
import androidx.compose.ui.input.pointer.pointerInput
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.unit.dp
import coil3.compose.AsyncImage
import coil3.compose.LocalPlatformContext
import coil3.request.ImageRequest
import com.museum.presentation.components.LoadingIndicator
import com.museum.utils.withNetworkTrafficTag // <-- Import the new utility
import museumkmp.shared.generated.resources.Res
import museumkmp.shared.generated.resources.wallpaper
import org.jetbrains.compose.resources.ExperimentalResourceApi
import org.jetbrains.compose.resources.painterResource

@OptIn(ExperimentalMaterial3Api::class, ExperimentalResourceApi::class)
@Composable
fun DetailScreen(
    viewModel: DetailViewModel,
    onNavigateBack: () -> Unit,
    modifier: Modifier = Modifier
) {
    com.museum.utils.LOG("DetailScreen - COMPOSING")
    val uiState by viewModel.uiState.collectAsState()
    com.museum.utils.LOG("DetailScreen - uiState collected: ${uiState::class.simpleName}")
    val wallpaperStatus by viewModel.wallpaperStatus.collectAsState()
    val snackbarHostState = remember { SnackbarHostState() }

    LaunchedEffect(wallpaperStatus) {
        when (wallpaperStatus) {
            is WallpaperStatus.Success -> {
                snackbarHostState.showSnackbar("Wallpaper set successfully!")
                viewModel.resetWallpaperStatus()
            }
            is WallpaperStatus.Error -> {
                snackbarHostState.showSnackbar((wallpaperStatus as WallpaperStatus.Error).message)
                viewModel.resetWallpaperStatus()
            }
            else -> {}
        }
    }

    Scaffold(
        topBar = {
            TopAppBar(
                title = {
                    when (val state = uiState) {
                        is DetailUiState.Success -> Text(state.site.getLocalizedName())
                        else -> Text("Detail")
                    }
                },
                navigationIcon = {
                    IconButton(onClick = onNavigateBack) {
                        Icon(Icons.Default.ArrowBack, contentDescription = "Back")
                    }
                },
                colors = TopAppBarDefaults.topAppBarColors(
                    containerColor = MaterialTheme.colorScheme.primaryContainer,
                    titleContentColor = MaterialTheme.colorScheme.onPrimaryContainer,
                    navigationIconContentColor = MaterialTheme.colorScheme.onPrimaryContainer
                )
            )
        },
        floatingActionButton = {
            if (uiState is DetailUiState.Success) {
                FloatingActionButton(
                    onClick = { viewModel.setAsWallpaper() },
                    containerColor = MaterialTheme.colorScheme.primaryContainer
                ) {
                    if (wallpaperStatus is WallpaperStatus.Loading) {
                        CircularProgressIndicator(
                            modifier = Modifier.size(24.dp),
                            color = MaterialTheme.colorScheme.onPrimaryContainer
                        )
                    } else {
                        Icon(
                            painter = painterResource(Res.drawable.wallpaper),
                            contentDescription = "Set as Wallpaper",
                            tint = MaterialTheme.colorScheme.onPrimaryContainer
                        )
                    }
                }
            }
        },
        snackbarHost = { SnackbarHost(snackbarHostState) }
    ) { paddingValues ->
        Box(modifier = modifier.fillMaxSize().padding(paddingValues)) {
            when (val state = uiState) {
                is DetailUiState.Loading -> LoadingIndicator()
                is DetailUiState.Error -> {
                    Box(modifier = Modifier.fillMaxSize(), contentAlignment = Alignment.Center) {
                        Text(state.message)
                    }
                }
                is DetailUiState.Success -> {
                    ZoomableImage(
                        imageUrl = state.site.imageUrl,
                        siteName = state.site.getLocalizedName()
                    )
                }
            }
        }
    }
}

@Composable
fun ZoomableImage(
    imageUrl: String?,
    siteName: String,
    modifier: Modifier = Modifier
) {
    var scale by remember { mutableStateOf(1f) }
    var offset by remember { mutableStateOf(Offset.Zero) }
    val context = LocalPlatformContext.current

    // Clear memory cache when this composable is disposed
    DisposableEffect(Unit) {
        onDispose {
            // Request garbage collection when leaving detail screen
            System.gc()
        }
    }

    Box(
        modifier = modifier
            .fillMaxSize()
            .background(MaterialTheme.colorScheme.background)
            .pointerInput(Unit) {
                detectTransformGestures { _, pan, zoom, _ ->
                    scale = (scale * zoom).coerceIn(1f, 5f)
                    if (scale > 1f) {
                        offset = Offset(
                            x = (offset.x + pan.x).coerceIn(-size.width.toFloat(), size.width.toFloat()),
                            y = (offset.y + pan.y).coerceIn(-size.height.toFloat(), size.height.toFloat())
                        )
                    } else {
                        offset = Offset.Zero
                    }
                }
            },
        contentAlignment = Alignment.Center
    ) {
        if (imageUrl.isNullOrBlank()) {
            Text("No image available")
        } else {
            val finalImageUrl = imageUrl.split(",").firstOrNull()?.trim()

            AsyncImage(
                model = withNetworkTrafficTag {ImageRequest.Builder(context)
                    .data(finalImageUrl)
                    .size(800, 800) // Limit to 800x800 to prevent OOM (sufficient for most phones)
                    .memoryCachePolicy(coil3.request.CachePolicy.ENABLED)
                    .diskCachePolicy(coil3.request.CachePolicy.ENABLED)
                    .build() },
                contentDescription = siteName,
                modifier = Modifier
                    .fillMaxSize()
                    .graphicsLayer(
                        scaleX = scale,
                        scaleY = scale,
                        translationX = offset.x,
                        translationY = offset.y
                    ),
                contentScale = ContentScale.Fit
            )
        }
    }
}
