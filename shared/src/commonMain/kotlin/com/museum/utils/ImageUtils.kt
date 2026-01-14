package com.museum.utils

/**
 * Convert a heritage site name to a drawable resource name by:
 * - Converting to lowercase
 * - Removing all special characters (spaces, apostrophes, quotes, commas, etc.)
 * - Keeping only alphanumeric characters
 */
fun String.toDrawableResourceName(): String {
    return this.lowercase()
        .replace(Regex("[^a-z0-9]"), "")
}
