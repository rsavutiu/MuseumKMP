package com.museum.utils

/**
 * Convert a heritage site name to a valid drawable resource name by:
 * - Converting to lowercase
 * - Removing all special characters (spaces, apostrophes, quotes, commas, etc.)
 * - Keeping only alphanumeric characters
 * - Prepending 'a' if the name starts with a digit
 */
fun String.toDrawableResourceName(): String {
    val sanitized = this.lowercase()
        .replace(Regex("[^a-z0-9]"), "")
    if (sanitized.firstOrNull()?.isDigit() == true) {
        return "a$sanitized"
    }
    return sanitized
}

fun getThumbnailCacheKey(siteId: Long): String {
    return "site_${siteId}_thumbnail"
}
