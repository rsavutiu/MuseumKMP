package com.museum.utils

import co.touchlab.kermit.Logger as KermitLogger
import co.touchlab.kermit.Severity

object Logger {
    private val logger = KermitLogger.withTag("MuseumApp")

    fun d(message: String) {
        logger.d { message }
    }

    fun i(message: String) {
        logger.i { message }
    }

    fun w(message: String) {
        logger.w { message }
    }

    fun e(message: String, throwable: Throwable? = null) {
        if (throwable != null) {
            logger.e(throwable) { message }
        } else {
            logger.e { message }
        }
    }

    fun v(message: String) {
        logger.v { message }
    }
}

// Convenience function for logging
fun LOG(message: String, level: LogLevel = LogLevel.DEBUG) {
    when (level) {
        LogLevel.VERBOSE -> Logger.v(message)
        LogLevel.DEBUG -> Logger.d(message)
        LogLevel.INFO -> Logger.i(message)
        LogLevel.WARN -> Logger.w(message)
        LogLevel.ERROR -> Logger.e(message)
    }
}

fun LOG(message: String, throwable: Throwable) {
    Logger.e(message, throwable)
}

enum class LogLevel {
    VERBOSE,
    DEBUG,
    INFO,
    WARN,
    ERROR
}

// Performance monitoring utilities
inline fun <T> measureTimeAndLog(tag: String, block: () -> T): T {
    val startTime = System.currentTimeMillis()
    val result = block()
    val duration = System.currentTimeMillis() - startTime

    // Log with WARNING if operation took longer than 1 frame (16ms at 60fps)
    if (duration > 16) {
        LOG("PERFORMANCE - $tag took ${duration}ms (>${16}ms frame budget!)", LogLevel.WARN)
    } else {
        LOG("PERFORMANCE - $tag took ${duration}ms", LogLevel.DEBUG)
    }

    return result
}

// Thread checker utility
fun checkMainThread() {
    val threadName = Thread.currentThread().name
    LOG("THREAD - Current thread: $threadName", LogLevel.DEBUG)
}
