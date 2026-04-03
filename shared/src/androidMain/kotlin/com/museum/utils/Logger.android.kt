package com.museum.utils

// Performance monitoring utilities
actual inline fun <T> measureTimeAndLog(tag: String, block: () -> T): T {
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
actual fun checkMainThread() {
    val threadName = Thread.currentThread().name
    LOG("THREAD - Current thread: $threadName", LogLevel.DEBUG)
}
