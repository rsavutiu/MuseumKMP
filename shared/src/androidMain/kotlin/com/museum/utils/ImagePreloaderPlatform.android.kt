package com.museum.utils

import android.content.Context
import coil3.PlatformContext

actual fun getDrawableResourceIdForPreload(context: PlatformContext, name: String): Int {
    return try {
        // PlatformContext on Android is an Android Context
        val androidContext = context as? Context ?: return 0
        androidContext.resources.getIdentifier(name, "drawable", androidContext.packageName)
    } catch (e: Exception) {
        0
    }
}
