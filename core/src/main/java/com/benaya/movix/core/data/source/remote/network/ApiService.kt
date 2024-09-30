package com.benaya.movix.core.data.source.remote.network

import com.benaya.movix.core.data.source.remote.response.FilmResponse
import retrofit2.http.GET
import retrofit2.http.Header
import retrofit2.http.Query

interface ApiService {

    @GET("movie/popular")
    suspend fun getList(
        @Header("Authorization") token: String,
    ): FilmResponse

    @GET("search/movie")
    suspend fun getSearchMovie(
        @Header("Authorization") token: String,
        @Query("query") query: String,
    ): FilmResponse

}
