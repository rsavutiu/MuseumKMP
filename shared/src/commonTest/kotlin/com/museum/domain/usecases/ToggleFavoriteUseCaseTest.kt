package com.museum.domain.usecases

import com.museum.data.models.HeritageSite
import com.museum.data.repository.IMuseumRepository
import io.mockk.coVerify
import io.mockk.just
import io.mockk.mockk
import io.mockk.runs
import kotlinx.coroutines.test.runTest
import kotlin.test.Test

class ToggleFavoriteUseCaseTest {

    private val repository = mockk<IMuseumRepository>(relaxed = true)
    private val useCase = ToggleFavoriteUseCase(repository)

    @Test
    fun `invoke calls toggleFavorite on repository with correct site`() = runTest {
        val site = createSite(id = 1, name = "Test Site", isFavorite = false)

        useCase(site)

        coVerify { repository.toggleFavorite(site) }
    }

    @Test
    fun `invoke works with favorite site`() = runTest {
        val site = createSite(id = 2, name = "Favorite Site", isFavorite = true)

        useCase(site)

        coVerify { repository.toggleFavorite(site) }
    }

    @Test
    fun `invoke works with non-favorite site`() = runTest {
        val site = createSite(id = 3, name = "Non-Favorite Site", isFavorite = false)

        useCase(site)

        coVerify { repository.toggleFavorite(site) }
    }

    private fun createSite(
        id: Long = 1,
        name: String = "Test Site",
        isFavorite: Boolean = false
    ) = HeritageSite(
        id = id,
        name = name,
        author = "Author",
        description = "Description",
        location = "Location",
        style = "Style",
        imageUrl = "url",
        isFavorite = isFavorite,
        wasViewed = false,
        nameRo = null,
        nameIt = null,
        nameEs = null,
        nameDe = null,
        nameFr = null,
        namePt = null,
        nameRu = null,
        nameAr = null,
        nameZh = null,
        nameJa = null,
        descriptionRo = null,
        descriptionIt = null,
        descriptionEs = null,
        descriptionDe = null,
        descriptionFr = null,
        descriptionPt = null,
        descriptionRu = null,
        descriptionAr = null,
        descriptionZh = null,
        descriptionJa = null,
        styleRo = null,
        styleIt = null,
        styleEs = null,
        styleDe = null,
        styleFr = null,
        stylePt = null,
        styleRu = null,
        styleAr = null,
        styleZh = null,
        styleJa = null,
        primaryColor = null,
        secondaryColor = null,
        backgroundColor = null,
        detailColor = null,
        longitude = null,
        latitude = null
    )
}
