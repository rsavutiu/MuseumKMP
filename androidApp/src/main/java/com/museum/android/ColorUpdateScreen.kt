package com.museum.android

import androidx.compose.foundation.layout.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.unit.dp
import com.museum.android.utils.ColorDatabaseUpdater
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext

@Composable
fun ColorUpdateScreen() {
    val context = LocalContext.current
    val scope = rememberCoroutineScope()

    var isProcessing by remember { mutableStateOf(false) }
    var result by remember { mutableStateOf<ColorDatabaseUpdater.UpdateResult?>(null) }
    var error by remember { mutableStateOf<String?>(null) }

    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp),
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Center
    ) {
        Text(
            text = "Color Database Updater",
            style = MaterialTheme.typography.headlineMedium
        )

        Spacer(modifier = Modifier.height(24.dp))

        Text(
            text = "This tool will extract colors from drawables and update the database for items with missing color data.",
            style = MaterialTheme.typography.bodyMedium
        )

        Spacer(modifier = Modifier.height(32.dp))

        Button(
            onClick = {
                scope.launch {
                    isProcessing = true
                    error = null
                    result = null

                    try {
                        val updater = ColorDatabaseUpdater(context)
                        val updateResult = withContext(Dispatchers.IO) {
                            updater.updateMissingColors()
                        }
                        result = updateResult
                    } catch (e: Exception) {
                        error = "Error: ${e.message}"
                        android.util.Log.e("ColorUpdateScreen", "Error updating colors", e)
                    } finally {
                        isProcessing = false
                    }
                }
            },
            enabled = !isProcessing
        ) {
            Text(if (isProcessing) "Processing..." else "Update Missing Colors")
        }

        if (isProcessing) {
            Spacer(modifier = Modifier.height(16.dp))
            CircularProgressIndicator()
        }

        error?.let { errorMessage ->
            Spacer(modifier = Modifier.height(16.dp))
            Card(
                colors = CardDefaults.cardColors(
                    containerColor = MaterialTheme.colorScheme.errorContainer
                )
            ) {
                Text(
                    text = errorMessage,
                    modifier = Modifier.padding(16.dp),
                    color = MaterialTheme.colorScheme.onErrorContainer
                )
            }
        }

        result?.let { updateResult ->
            Spacer(modifier = Modifier.height(24.dp))
            Card {
                Column(
                    modifier = Modifier.padding(16.dp)
                ) {
                    Text(
                        text = "Update Complete",
                        style = MaterialTheme.typography.titleLarge
                    )
                    Spacer(modifier = Modifier.height(8.dp))
                    Text("Total items found: ${updateResult.totalFound}")
                    Text("Successfully updated: ${updateResult.successCount}")
                    Text("Failed: ${updateResult.failureCount}")

                    if (updateResult.failedItems.isNotEmpty()) {
                        Spacer(modifier = Modifier.height(8.dp))
                        Text(
                            text = "Failed items:",
                            style = MaterialTheme.typography.titleSmall
                        )
                        updateResult.failedItems.take(10).forEach { item ->
                            Text("• $item", style = MaterialTheme.typography.bodySmall)
                        }
                        if (updateResult.failedItems.size > 10) {
                            Text(
                                "... and ${updateResult.failedItems.size - 10} more",
                                style = MaterialTheme.typography.bodySmall
                            )
                        }
                    }
                }
            }
        }
    }
}
