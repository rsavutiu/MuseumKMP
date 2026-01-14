package com.museum.presentation.theme

import androidx.compose.foundation.isSystemInDarkTheme
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.graphics.Color

private val LightColorScheme = lightColorScheme(
    primary = IndigoPrimary,
    onPrimary = Color.White,
    primaryContainer = IndigoPrimary,
    onPrimaryContainer = Color.White,
    secondary = TealSecondary,
    onSecondary = Color.White,
    background = BackgroundLight,
    surface = SurfaceLight
)

private val DarkColorScheme = darkColorScheme(
    primary = IndigoLight,
    onPrimary = Color.Black,
    primaryContainer = IndigoPrimary,
    onPrimaryContainer = Color.White,
    secondary = TealLight,
    background = BackgroundDark,
    surface = SurfaceDark
)

@Composable
fun MuseumTheme(
    darkTheme: Boolean = isSystemInDarkTheme(),
    content: @Composable () -> Unit
) {
    val colorScheme = if (darkTheme) DarkColorScheme else LightColorScheme

    MaterialTheme(
        colorScheme = colorScheme,
        content = content
    )
}
