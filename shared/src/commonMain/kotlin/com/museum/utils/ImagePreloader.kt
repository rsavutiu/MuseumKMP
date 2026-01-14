package com.museum.utils

import coil3.ImageLoader
import coil3.PlatformContext
import coil3.request.ImageRequest
import com.museum.data.models.HeritageSite
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.IO
import kotlinx.coroutines.async
import kotlinx.coroutines.awaitAll
import kotlinx.coroutines.withContext
import com.museum.utils.toDrawableResourceName

class ImagePreloader(
    private val context: PlatformContext,
    private val imageLoader: ImageLoader
) {
    private val preloadedItems = mutableSetOf<String>()

    suspend fun preloadImages(
        sites: List<HeritageSite>,
        currentIndex: Int,
        preloadCount: Int = 15
    ) = withContext(Dispatchers.IO) {
        val startIndex = (currentIndex).coerceAtLeast(0)
        val endIndex = (currentIndex + preloadCount).coerceAtMost(sites.size - 1)

        // Preload images in parallel for maximum speed
        val jobs = (startIndex..endIndex).mapNotNull { i ->
            val site = sites.getOrNull(i) ?: return@mapNotNull null
            val cacheKey = getThumbnailCacheKey(site.id)

            // Skip if already preloaded
            if (preloadedItems.contains(cacheKey)) return@mapNotNull null
            preloadedItems.add(cacheKey)

            async {
                // Get the image URL or use the drawable resource name
                val imageUrl = site.imageUrl?.split(",")?.firstOrNull()?.trim()
                val isRemoteUrl = imageUrl?.startsWith("http", ignoreCase = true) == true

                // Try to get drawable resource ID for local images
                val resourceName = site.name.toDrawableResourceName()
                val drawableId = getDrawableResourceIdForPreload(context, resourceName)

                // Determine what to preload
                val imageData = when {
                    drawableId != 0 -> drawableId // Use drawable resource ID
                    isRemoteUrl -> imageUrl // Use remote URL
                    else -> null // Nothing to preload
                }

                imageData?.let { data ->
                    val request = ImageRequest.Builder(context)
                        .data(data)
                        .size(800, 800) // Decode at smaller size to reduce memory pressure
                        .memoryCacheKey(cacheKey)
                        .diskCachePolicy(coil3.request.CachePolicy.DISABLED) // Don't write decoded bitmap to disk cache
                        .memoryCachePolicy(coil3.request.CachePolicy.ENABLED) // Store decoded bitmap in memory
                        .build()
                    // Execute the request to preload and decode into memory cache
                    try {
                        imageLoader.execute(request)
                    } catch (e: Exception) {
                        // Ignore errors during preload
                    }
                }
            }
        }

        // Wait for all preloads to complete
        jobs.awaitAll()
    }

    fun clearCache() {
        preloadedItems.clear()
    }
}

// Platform-specific function to get drawable ID outside of Composable context
expect fun getDrawableResourceIdForPreload(context: PlatformContext, name: String): Int
