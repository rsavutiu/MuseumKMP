package com.museum.data.local

import app.cash.sqldelight.db.SqlDriver
import app.cash.sqldelight.driver.native.NativeSqliteDriver

actual class DatabaseDriverFactory {
    actual fun createDriver(): SqlDriver {
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
                    // Drop all tables to force recreation
                    driver.execute(null, "DROP TABLE IF EXISTS HeritageSite", 0)
                    driver.execute(null, "DROP TABLE IF EXISTS Favorite", 0)
                }
                return MuseumDatabase.Schema.create(driver)
            }
        }

        return NativeSqliteDriver(
            schema = schema,
            name = "museum.db"
        )
    }
}
