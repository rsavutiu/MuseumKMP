package com.museum.utils

import coil3.ImageLoader
import coil3.PlatformContext
import com.museum.data.models.HeritageSite

// Re-export from whitelabel-platform with museum-specific extensions

class ImagePreloader(
    context: PlatformContext,
    imageLoader: ImageLoader
) {
    private val platformPreloader = com.whitelabel.platform.utils.ImagePreloader(
        context, 
        imageLoader, 
        "MuseumApp"
    )

    suspend fun preloadImages(
        sites: List<HeritageSite>,
        currentIndex: Int,
        preloadCount: Int = 15
    ) {
        // Use platform preloader with museum-specific extractors
        val endIndex = (currentIndex + preloadCount).coerceAtMost(sites.size - 1)
        val itemsToPreload = sites.subList(currentIndex.coerceAtLeast(0), endIndex)
        
        itemsToPreload.forEach { site ->
            val imageUrl = site.imageUrl?.split(",")?.firstOrNull()?.trim()
            if (!imageUrl.isNullOrBlank()) {
                platformPreloader.preloadImage(
                    imageUrl = imageUrl,
                    cacheKey = getThumbnailCacheKey(site.id)
                )
            }
        }
    }

    fun clearCache() {
        platformPreloader.clearCache()
    }
}

// Cache key functions that delegate to platform
fun getThumbnailCacheKey(siteId: Long): String {
    return com.whitelabel.platform.utils.getThumbnailCacheKey(siteId, "site")
}

fun getFullImageCacheKey(siteId: Long): String {
    return com.whitelabel.platform.utils.getFullImageCacheKey(siteId, "site")
}
