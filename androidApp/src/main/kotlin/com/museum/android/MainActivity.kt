package com.museum.android

import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Surface
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import com.museum.presentation.theme.MuseumTheme
import com.whitelabel.platform.WhitelabelActivity

class MainActivity : WhitelabelActivity() {
    @Composable
    override fun createContent() {
        MuseumTheme {
            Surface(
                modifier = Modifier.fillMaxSize(),
                color = MaterialTheme.colorScheme.background
            ) {
                AppNavigation()
            }
        }
    }
}
