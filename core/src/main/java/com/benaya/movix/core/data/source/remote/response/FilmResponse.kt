package com.benaya.movix.core.data.source.remote.response

import com.google.gson.annotations.SerializedName

data class FilmResponse(

    @field:SerializedName("page")
    val page: Int? = null,

    @field:SerializedName("total_pages")
    val totalPages: Int? = null,

    @field:SerializedName("results")
    val results: List<ResultsItem>,

    @field:SerializedName("total_results")
    val totalResults: Int? = null
)

data class ResultsItem(

    @field:SerializedName("overview")
    val overview: String,

    @field:SerializedName("original_language")
    val originalLanguage: String? = null,

    @field:SerializedName("original_title")
    val originalTitle: String? = null,

    @field:SerializedName("video")
    val video: Boolean? = null,

    @field:SerializedName("title")
    val title: String,

    @field:SerializedName("genre_ids")
    val genreIds: List<Int?>? = null,

    @field:SerializedName("poster_path")
    val posterPath: String? = null,

    @field:SerializedName("backdrop_path")
    val backdropPath: String? = null,

    @field:SerializedName("release_date")
    val releaseDate: String,

    @field:SerializedName("popularity")
    val popularity: Any? = null,

    @field:SerializedName("vote_average")
    val voteAverage: Double,

    @field:SerializedName("id")
    val id: String,

    @field:SerializedName("adult")
    val adult: Boolean? = null,

    @field:SerializedName("vote_count")
    val voteCount: Int? = null
)
