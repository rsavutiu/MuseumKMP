package com.museum.utils

import android.content.Context
import coil3.PlatformContext

actual fun getDrawableResourceIdForPreload(context: PlatformContext, name: String): Int {
    val androidContext = context as Context
    return androidContext.resources.getIdentifier(name, "drawable", androidContext.packageName)
}
