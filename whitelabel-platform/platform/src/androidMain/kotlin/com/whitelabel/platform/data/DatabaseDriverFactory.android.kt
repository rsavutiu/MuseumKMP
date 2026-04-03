package com.whitelabel.platform.data

import android.content.Context
import app.cash.sqldelight.db.SqlDriver
import app.cash.sqldelight.driver.android.AndroidSqliteDriver
import com.museum.data.local.MuseumDatabase
import java.io.File
import java.io.FileOutputStream

actual class DatabaseDriverFactory(private val context: Context) {
    actual fun createDriver(): SqlDriver {
        val dbFile = context.getDatabasePath("heritage_sites.db")

        // Helper function to copy database from assets
        fun copyDatabaseFromAssets() {
            dbFile.parentFile?.mkdirs()
            context.assets.open("heritage_sites.db").use { input ->
                FileOutputStream(dbFile).use { output ->
                    input.copyTo(output)
                }
            }
        }

        if (!dbFile.exists()) {
            copyDatabaseFromAssets()
        }

        // Create a schema wrapper that deletes and recreates on version mismatch
        val schema = object : app.cash.sqldelight.db.SqlSchema<app.cash.sqldelight.db.QueryResult.Value<Unit>> {
            override val version: Long = MuseumDatabase.Schema.version

            override fun create(driver: app.cash.sqldelight.db.SqlDriver): app.cash.sqldelight.db.QueryResult.Value<Unit> {
                return MuseumDatabase.Schema.create(driver)
            }

            override fun migrate(
                driver: app.cash.sqldelight.db.SqlDriver,
                oldVersion: Long,
                newVersion: Long,
                vararg callbacks: app.cash.sqldelight.db.AfterVersion
            ): app.cash.sqldelight.db.QueryResult.Value<Unit> {
                // Delete and recreate database on version mismatch
                if (oldVersion != newVersion) {
                    // Close the driver first
                    driver.close()
                    // Delete the database file
                    dbFile.delete()
                    // Copy fresh database from assets
                    copyDatabaseFromAssets()
                }
                return MuseumDatabase.Schema.create(driver)
            }
        }

        return AndroidSqliteDriver(
            schema = schema,
            context = context,
            name = "heritage_sites.db"
        )
    }
}
