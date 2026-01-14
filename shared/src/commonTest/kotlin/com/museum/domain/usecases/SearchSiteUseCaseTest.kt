package com.museum.domain.usecases

import app.cash.turbine.test
import com.museum.data.models.HeritageSite
import com.museum.data.repository.IMuseumRepository
import io.mockk.every
import io.mockk.mockk
import io.mockk.verify
import kotlinx.coroutines.flow.flowOf
import kotlinx.coroutines.test.runTest
import kotlin.test.Test
import kotlin.test.assertEquals

class SearchSiteUseCaseTest {

    private val repository = mockk<IMuseumRepository>()
    private val useCase = SearchSiteUseCase(repository)

    @Test
    fun `invoke with valid query calls searchSites on repository`() = runTest {
        val sites = listOf(createSite(id = 1, name = "Matching Site"))
        every { repository.searchSites("query") } returns flowOf(sites)

        useCase("query").test {
            val result = awaitItem()
            assertEquals(1, result.size)
            assertEquals("Matching Site", result[0].name)
            awaitComplete()
        }

        verify { repository.searchSites("query") }
    }

    @Test
    fun `invoke with blank query calls getAllSites on repository`() = runTest {
        val sites = listOf(
            createSite(id = 1, name = "Site 1"),
            createSite(id = 2, name = "Site 2")
        )
        every { repository.getAllSites() } returns flowOf(sites)

        useCase("   ").test {
            val result = awaitItem()
            assertEquals(2, result.size)
            awaitComplete()
        }

        verify { repository.getAllSites() }
    }

    @Test
    fun `invoke with empty query calls getAllSites on repository`() = runTest {
        val sites = listOf(createSite(id = 1, name = "Site 1"))
        every { repository.getAllSites() } returns flowOf(sites)

        useCase("").test {
            val result = awaitItem()
            assertEquals(1, result.size)
            awaitComplete()
        }

        verify { repository.getAllSites() }
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
