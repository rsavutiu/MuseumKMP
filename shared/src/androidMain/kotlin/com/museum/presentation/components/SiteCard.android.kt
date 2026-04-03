package com.museum.presentation.components

import androidx.compose.runtime.Composable
import androidx.compose.ui.platform.LocalContext
import com.museum.data.models.HeritageSite
import com.museum.utils.toDrawableResourceName

/**
 * Android implementation that looks up local drawable resources.
 */
@Composable
actual fun getSiteDrawableId(site: HeritageSite): Int? {
    val context = LocalContext.current
    val resourceName = site.name.toDrawableResourceName()
    val resourceId = context.resources.getIdentifier(resourceName, "drawable", context.packageName)
    return if (resourceId != 0) resourceId else null
}
