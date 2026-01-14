package com.museum.presentation.screens.site

import androidx.compose.runtime.Composable
import coil3.request.ImageRequest
import com.museum.utils.getPlatformContext

@Composable
actual fun imageRequestBuilder(): ImageRequest.Builder {
    return ImageRequest.Builder(getPlatformContext())
}