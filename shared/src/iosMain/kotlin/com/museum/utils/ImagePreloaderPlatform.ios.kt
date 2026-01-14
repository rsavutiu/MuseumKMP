package com.museum.utils

import coil3.PlatformContext

actual fun getDrawableResourceIdForPreload(context: PlatformContext, name: String): Int {
    // iOS doesn't use drawable resource IDs
    return 0
}
