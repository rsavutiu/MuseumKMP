package com.museum.utils

actual fun <T> withNetworkTrafficTag(block: () -> T): T = block()