package com.museum.data.models

data class CountrySiteGroup(
    val country: Country,
    val sites: List<HeritageSite>
)
