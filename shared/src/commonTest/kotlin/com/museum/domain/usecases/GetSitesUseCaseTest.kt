package com.museum.domain.usecases

import app.cash.turbine.test
import com.museum.data.models.HeritageSite
import com.museum.data.repository.IMuseumRepository
import io.mockk.every
import io.mockk.mockk
import kotlinx.coroutines.flow.flowOf
import kotlinx.coroutines.test.runTest
import kotlin.test.Test
import kotlin.test.assertEquals

class GetSitesUseCaseTest {

    private val repository = mockk<IMuseumRepository>()
    private val useCase = GetSitesUseCase(repository)

    @Test
    fun `invoke returns all sites from repository`() = runTest {
        val sites = listOf(
            createSite(id = 1, name = "Site 1"),
            createSite(id = 2, name = "Site 2")
        )
        every { repository.getAllSites() } returns flowOf(sites)

        useCase().test {
            val result = awaitItem()
            assertEquals(2, result.size)
            assertEquals("Site 1", result[0].name)
            assertEquals("Site 2", result[1].name)
            awaitComplete()
        }
    }

    @Test
    fun `invoke returns empty list when repository has no sites`() = runTest {
        every { repository.getAllSites() } returns flowOf(emptyList())

        useCase().test {
            val result = awaitItem()
            assertEquals(0, result.size)
            awaitComplete()
        }
    }

    private fun createSite(
        id: Long = 1,
        name: String = "Test Site"
    ) = HeritageSite(
        id = id,
        name = name,
        author = "Author",
        description = "Description",
        location = "Location",
        style = "Style",
        imageUrl = "url",
        isFavorite = false,
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
