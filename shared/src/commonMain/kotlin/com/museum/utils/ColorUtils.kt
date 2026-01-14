package com.museum.utils

import androidx.compose.ui.graphics.Color
import com.museum.data.models.HeritageSite

/**
 * Convert an ARGB integer to a Compose Color.
 * Handles null values by returning a default color.
 */
fun Int?.toComposeColor(default: Color = Color.Gray): Color {
    if (this == null) return default
    return Color(this)
}

/**
 * Blend two colors together with a given ratio.
 * @param color1 The first color
 * @param color2 The second color
 * @param ratio The ratio of color2 in the blend (0.0 to 1.0)
 * @return The blended color
 */
fun blendColors(color1: Color, color2: Color, ratio: Float): Color {
    val inverseRatio = 1f - ratio
    return Color(
        red = color1.red * inverseRatio + color2.red * ratio,
        green = color1.green * inverseRatio + color2.green * ratio,
        blue = color1.blue * inverseRatio + color2.blue * ratio,
        alpha = color1.alpha * inverseRatio + color2.alpha * ratio
    )
}

/**
 * Get the card background color for a HeritageSite.
 * Uses the blending formula from the old app:
 * blend(background, blend(primary, secondary, 0.75), 0.2)
 */
fun HeritageSite.getCardBackgroundColor(): Color {
    val primary = primaryColor.toComposeColor(Color(0xFFE0E0E0))
    val secondary = secondaryColor.toComposeColor(primary)
    val background = backgroundColor.toComposeColor(Color(0xFFF5F5F5))

    // First blend primary and secondary with 0.75 ratio
    val primarySecondaryBlend = blendColors(primary, secondary, 0.75f)

    // Then blend the result with background with 0.2 ratio
    return blendColors(background, primarySecondaryBlend, 0.2f)
}

/**
 * Get the primary color for a HeritageSite, with a default fallback.
 */
fun HeritageSite.getPrimaryColor(default: Color = Color(0xFF6200EE)): Color {
    return primaryColor.toComposeColor(default)
}

/**
 * Get the secondary color for a HeritageSite, with a default fallback.
 */
fun HeritageSite.getSecondaryColor(default: Color = Color(0xFF03DAC6)): Color {
    return secondaryColor.toComposeColor(default)
}

/**
 * Get the background color for a HeritageSite, with a default fallback.
 */
fun HeritageSite.getBackgroundColor(default: Color = Color(0xFFF5F5F5)): Color {
    return backgroundColor.toComposeColor(default)
}

/**
 * Get the detail color for a HeritageSite, with a default fallback.
 */
fun HeritageSite.getDetailColor(default: Color = Color(0xFF6200EE)): Color {
    return detailColor.toComposeColor(default)
}
