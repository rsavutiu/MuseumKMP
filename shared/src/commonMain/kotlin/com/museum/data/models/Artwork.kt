package com.museum.data.models

data class Artwork(
    val id: Long,
    val title: String,
    val artistName: String,
    val year: String?,
    val imageUrl: String?,
    val description: String?,
    val museumId: Long,
    val isFavorite: Boolean = false,
    val primaryColor: Int? = null,
    val secondaryColor: Int? = null,
    val backgroundColor: Int? = null,
    val detailColor: Int? = null
)
