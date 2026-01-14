package com.museum.data.local

import android.content.Context
import app.cash.sqldelight.db.SqlDriver
import app.cash.sqldelight.driver.android.AndroidSqliteDriver
import java.io.File
import java.io.FileOutputStream

actual class DatabaseDriverFactory(private val context: Context) {
    actual fun createDriver(): SqlDriver {
        val dbFile = context.getDatabasePath("heritage_sites.db")

        if (!dbFile.exists()) {
            dbFile.parentFile?.mkdirs()
            context.assets.open("heritage_sites.db").use { input ->
                FileOutputStream(dbFile).use { output ->
                    input.copyTo(output)
                }
            }
        }

        // Create a schema wrapper with version 6
        val schemaVersion6 = object : app.cash.sqldelight.db.SqlSchema<app.cash.sqldelight.db.QueryResult.Value<Unit>> {
            override val version: Long = 6

            override fun create(driver: app.cash.sqldelight.db.SqlDriver): app.cash.sqldelight.db.QueryResult.Value<Unit> {
                return MuseumDatabase.Schema.create(driver)
            }

            override fun migrate(
                driver: app.cash.sqldelight.db.SqlDriver,
                oldVersion: Long,
                newVersion: Long,
                vararg callbacks: app.cash.sqldelight.db.AfterVersion
            ): app.cash.sqldelight.db.QueryResult.Value<Unit> {
                // Ensure all tables exist regardless of version
                // This handles the case where the database exists but is missing tables
                return MuseumDatabase.Schema.create(driver)
            }
        }

        return AndroidSqliteDriver(
            schema = schemaVersion6,
            context = context,
            name = "heritage_sites.db"
        )
    }
}
