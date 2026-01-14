package com.museum.utils

import androidx.compose.runtime.Composable
import coil3.PlatformContext
import coil3.SingletonImageLoader

@Composable
actual fun getPlatformContext(): PlatformContext = SingletonImageLoader.get(true).context

@Composable
actual fun getDrawableResourceId(name: String): Int {
    // iOS doesn't use drawable resources in the same way as Android.
    // We'll return 0 as a placeholder.
    return 0
}

@Composable
actual fun getStringResource(id: String): String {
    return id
}
