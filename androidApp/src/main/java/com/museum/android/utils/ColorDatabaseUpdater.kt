package com.museum.android.utils

import android.content.Context
import android.database.sqlite.SQLiteDatabase
import android.util.Log
import java.io.File

class ColorDatabaseUpdater(private val context: Context) {

    private val TAG = "ColorDatabaseUpdater"

    fun updateMissingColors(): UpdateResult {
        val dbPath = getDatabasePath()
        if (!dbPath.exists()) {
            Log.e(TAG, "Database not found at: ${dbPath.absolutePath}")
            return UpdateResult(0, 0, 0, emptyList())
        }

        val database = SQLiteDatabase.openDatabase(
            dbPath.absolutePath,
            null,
            SQLiteDatabase.OPEN_READWRITE
        )

        return try {
            val rowsWithMissingColors = findRowsWithMissingColors(database)
            Log.i(TAG, "Found ${rowsWithMissingColors.size} rows with missing colors")

            var successCount = 0
            var failureCount = 0
            val failedItems = mutableListOf<String>()

            rowsWithMissingColors.forEach { item ->
                try {
                    val drawableName = item.paintingName.toDrawableResourceName()
                    val colors = ColorExtractor.extractColorsFromDrawableName(context, drawableName)

                    if (colors != null) {
                        updateColors(database, item.id, colors)
                        successCount++
                        Log.d(TAG, "Updated colors for: ${item.paintingName}")
                    } else {
                        failureCount++
                        failedItems.add(item.paintingName)
                        Log.w(TAG, "Failed to extract colors for: ${item.paintingName} (drawable: $drawableName)")
                    }
                } catch (e: Exception) {
                    failureCount++
                    failedItems.add(item.paintingName)
                    Log.e(TAG, "Error processing ${item.paintingName}", e)
                }
            }

            UpdateResult(rowsWithMissingColors.size, successCount, failureCount, failedItems)
        } finally {
            database.close()
        }
    }

    private fun findRowsWithMissingColors(database: SQLiteDatabase): List<MuseumItemInfo> {
        val items = mutableListOf<MuseumItemInfo>()
        val cursor = database.rawQuery(
            """
            SELECT id, paintingname
            FROM museum_item
            WHERE prim_color IS NULL
               OR sec_color IS NULL
               OR background_color IS NULL
               OR detail_color IS NULL
            """.trimIndent(),
            null
        )

        cursor.use {
            while (it.moveToNext()) {
                val id = it.getLong(0)
                val paintingName = it.getString(1) ?: continue
                items.add(MuseumItemInfo(id, paintingName))
            }
        }

        return items
    }

    private fun updateColors(database: SQLiteDatabase, itemId: Long, colors: ExtractedColors) {
        database.execSQL(
            """
            UPDATE museum_item
            SET prim_color = ?,
                sec_color = ?,
                background_color = ?,
                detail_color = ?
            WHERE id = ?
            """.trimIndent(),
            arrayOf(
                colors.primaryColor,
                colors.secondaryColor,
                colors.backgroundColor,
                colors.detailColor,
                itemId
            )
        )
    }

    private fun getDatabasePath(): File {
        val dbName = "heritage_sites.db"
        return context.getDatabasePath(dbName)
    }

    private fun String.toDrawableResourceName(): String {
        val sanitized = this.lowercase()
            .replace(Regex("[^a-z0-9]"), "")
        if (sanitized.firstOrNull()?.isDigit() == true) {
            return "a$sanitized"
        }
        return sanitized
    }

    data class MuseumItemInfo(
        val id: Long,
        val paintingName: String
    )

    data class UpdateResult(
        val totalFound: Int,
        val successCount: Int,
        val failureCount: Int,
        val failedItems: List<String>
    ) {
        override fun toString(): String {
            return """
                Color Update Results:
                - Total items with missing colors: $totalFound
                - Successfully updated: $successCount
                - Failed to update: $failureCount
                ${if (failedItems.isNotEmpty()) "\nFailed items:\n${failedItems.joinToString("\n") { "  - $it" }}" else ""}
            """.trimIndent()
        }
    }
}
