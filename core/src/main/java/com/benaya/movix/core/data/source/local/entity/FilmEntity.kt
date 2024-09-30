package com.benaya.movix.core.data.source.local.entity

import androidx.room.ColumnInfo
import androidx.room.Entity
import androidx.room.PrimaryKey

@Entity(tableName = "film")
data class FilmEntity(
    @PrimaryKey
    @ColumnInfo(name = "filmId")
    var filmId: String,

    @ColumnInfo(name = "title")
    var title: String,

    @ColumnInfo(name = "overview")
    var overview: String,

    @ColumnInfo(name = "image")
    var image: String?,

    @ColumnInfo(name = "releaseDate")
    var releaseDate: String,

    @ColumnInfo(name = "vote")
    var vote: Double,

    @ColumnInfo(name = "isFavorite")
    var isFavorite: Boolean = false
)