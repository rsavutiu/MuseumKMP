package com.museum.data.models

data class Museum(
    val id: Long,
    val name: String,
    val location: String?,
    val description: String?,
    val imageUrl: String?
)
