package com.benaya.submissionandrofilmIdexpert.core.utils

import com.benaya.movix.core.data.source.local.entity.FilmEntity
import com.benaya.movix.core.data.source.remote.response.ResultsItem
import com.benaya.movix.core.domain.model.Film

object DataMapper {
    fun mapResponsesToEntities(input: List<ResultsItem>): List<FilmEntity> {
        val filmList = ArrayList<FilmEntity>()
        input.map {
            val film = FilmEntity(
                filmId = it.id,
                overview = it.overview,
                title = it.title,
                releaseDate = it.releaseDate,
                vote = it.voteAverage,
                image = it.posterPath,

            )
            filmList.add(film)
        }
        return filmList
    }

    fun mapEntitiesToDomain(input: List<FilmEntity>): List<Film> =
        input.map {
            Film(
                filmId = it.filmId,
                overview = it.overview,
                title = it.title,
                releaseDate = it.releaseDate,
                vote = it.vote,
                image = it.image,
                isFavorite = it.isFavorite,
            )
        }

    fun mapDomainToEntity(input: Film) = FilmEntity(
        filmId = input.filmId,
        overview = input.overview,
        title = input.title,
        releaseDate = input.releaseDate,
        vote = input.vote,
        image = input.image,
    )

    fun mapResponseToDomain(input: List<ResultsItem>): List<Film> = input.map {
        Film(
            filmId = it.id,
            overview = it.overview,
            title = it.title,
            releaseDate = it.releaseDate,
            vote = it.voteAverage,
            image = it.posterPath,
            isFavorite = false,
        )
    }
}