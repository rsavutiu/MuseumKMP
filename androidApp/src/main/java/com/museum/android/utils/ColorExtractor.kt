package com.museum.android.utils

import android.content.Context
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import androidx.palette.graphics.Palette

data class ExtractedColors(
    val primaryColor: Int,
    val secondaryColor: Int,
    val backgroundColor: Int,
    val detailColor: Int
)

object ColorExtractor {

    fun extractColorsFromDrawable(context: Context, drawableResId: Int): ExtractedColors? {
        if (drawableResId == 0) return null

        return try {
            val bitmap = BitmapFactory.decodeResource(context.resources, drawableResId)
            extractColorsFromBitmap(bitmap)
        } catch (e: Exception) {
            android.util.Log.e("ColorExtractor", "Error extracting colors from drawable $drawableResId", e)
            null
        }
    }

    fun extractColorsFromBitmap(bitmap: Bitmap): ExtractedColors? {
        return try {
            val palette = Palette.from(bitmap).generate()

            val vibrantSwatch = palette.vibrantSwatch
            val mutedSwatch = palette.mutedSwatch
            val dominantColor = palette.dominantSwatch
            val lightVibrant = palette.lightVibrantSwatch
            val darkVibrant = palette.darkVibrantSwatch
            val lightMuted = palette.lightMutedSwatch
            val darkMuted = palette.darkMutedSwatch

            val primaryColor = vibrantSwatch?.rgb
                ?: dominantColor?.rgb
                ?: mutedSwatch?.rgb
                ?: 0xFF6200EE.toInt()

            val secondaryColor = mutedSwatch?.rgb
                ?: lightVibrant?.rgb
                ?: lightMuted?.rgb
                ?: 0xFF03DAC6.toInt()

            val backgroundColor = lightMuted?.rgb
                ?: mutedSwatch?.rgb
                ?: dominantColor?.rgb
                ?: 0xFFF5F5F5.toInt()

            val detailColor = darkVibrant?.rgb
                ?: darkMuted?.rgb
                ?: vibrantSwatch?.rgb
                ?: primaryColor

            ExtractedColors(
                primaryColor = primaryColor,
                secondaryColor = secondaryColor,
                backgroundColor = backgroundColor,
                detailColor = detailColor
            )
        } catch (e: Exception) {
            android.util.Log.e("ColorExtractor", "Error generating palette", e)
            null
        }
    }

    fun extractColorsFromDrawableName(context: Context, drawableName: String): ExtractedColors? {
        val drawableResId = context.resources.getIdentifier(drawableName, "drawable", context.packageName)
        return extractColorsFromDrawable(context, drawableResId)
    }
}
