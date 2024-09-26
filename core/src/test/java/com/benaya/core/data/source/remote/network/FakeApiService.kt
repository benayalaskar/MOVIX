package com.benaya.core.data.source.remote.network

import com.benaya.core.utils.DataDummy
import com.benaya.movix.core.data.source.remote.network.ApiService
import com.benaya.movix.core.data.source.remote.response.FilmResponse

class FakeApiService : ApiService {
    private val dummyResponse = DataDummy.generateDummyNewsResponse()

    override suspend fun getList(token: String): FilmResponse {
        return dummyResponse
    }

    override suspend fun getSearchMovie(token: String, query: String): FilmResponse {
        return dummyResponse
    }
}