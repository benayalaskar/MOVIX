package com.benaya.movix.core.data.source.local

import com.benaya.movix.core.data.source.local.entity.FilmEntity
import com.benaya.movix.core.data.source.local.room.FilmDao
import kotlinx.coroutines.flow.Flow

class LocalDataSource(private val filmDao: FilmDao) {

    fun getAllNonFavoriteFilms(): Flow<List<FilmEntity>> = filmDao.getAllNonFavoriteFilms()

    fun getFavoriteFilm(): Flow<List<FilmEntity>> = filmDao.getFavoriteFilm()

    suspend fun insertListFilms(films: List<FilmEntity>) = filmDao.insertListFilms(films)

    fun setFavoriteFilm(film: FilmEntity, newState: Boolean) {
        film.isFavorite = newState
        filmDao.insertFilm(film)
    }
}