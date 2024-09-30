package com.benaya.movix.core.domain.model

import android.os.Parcelable
import kotlinx.parcelize.Parcelize

@Parcelize
data class Film(
    val filmId: String,
    val title: String,
    val overview: String,
    val image: String?,
    val releaseDate: String,
    val vote: Double,
    val isFavorite: Boolean,
) : Parcelable

