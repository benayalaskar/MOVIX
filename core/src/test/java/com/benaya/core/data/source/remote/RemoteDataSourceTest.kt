package com.benaya.core.data.source.remote

import com.benaya.core.data.source.remote.network.FakeApiService
import com.benaya.core.utils.DataDummy
import com.benaya.movix.core.data.source.remote.response.FilmResponse
import kotlinx.coroutines.ExperimentalCoroutinesApi
import kotlinx.coroutines.test.runTest
import org.junit.Assert
import org.junit.Test
import org.junit.runner.RunWith
import org.mockito.Mock
import org.mockito.Mockito.`when`
import org.mockito.junit.MockitoJUnitRunner

@ExperimentalCoroutinesApi
@RunWith(MockitoJUnitRunner::class)
class RemoteDataSourceTest {

    @Mock
    private lateinit var apiService: FakeApiService

    @Test
    fun `when Get Movie Should Not Null and Return Data`() = runTest {
        val expectedValue = DataDummy.generateDummyNewsResponse()
        `when`(apiService.getList("token")).thenReturn(expectedValue)

        val actualValue = apiService.getList("token")

        Assert.assertNotNull(actualValue)
        Assert.assertEquals(actualValue.results, expectedValue.results)
    }

    @Test
    fun `when Search Movie Should Not Null and Return Data`() = runTest {
        val expectedValue = DataDummy.generateDummyNewsResponse()
        `when`(apiService.getSearchMovie("token", "title 10")).thenReturn(expectedValue)

        val actualValue = apiService.getSearchMovie("token", "title 10")
        Assert.assertNotNull(actualValue)
        Assert.assertEquals(actualValue.results.first().title, expectedValue.results.first().title)
    }

    @Test
    fun `when Search Movie Empty Should Return No Data`() = runTest {
        val expectedValue = FilmResponse(results = emptyList())
        `when`(apiService.getSearchMovie("token", "title 11")).thenReturn(expectedValue)

        val actualValue = apiService.getSearchMovie("token", "title 11")

        Assert.assertEquals(actualValue.results.size, 0)
    }


}