package com.museum.presentation.components

import androidx.compose.runtime.Composable
import com.museum.data.models.HeritageSite

/**
 * iOS implementation - returns null as iOS uses URLs or bundled assets differently.
 */
@Composable
actual fun getSiteDrawableId(site: HeritageSite): Int? = null
