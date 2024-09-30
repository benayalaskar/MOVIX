package com.benaya.movix.core.data.source.local.room

import androidx.room.Dao
import androidx.room.Insert
import androidx.room.OnConflictStrategy
import androidx.room.Query
import com.benaya.movix.core.data.source.local.entity.FilmEntity
import kotlinx.coroutines.flow.Flow

@Dao
interface FilmDao {

    @Query("SELECT * FROM film WHERE isFavorite = 0")
    fun getAllNonFavoriteFilms(): Flow<List<FilmEntity>>

    @Query("SELECT * FROM film WHERE isFavorite = 1")
    fun getFavoriteFilm(): Flow<List<FilmEntity>>

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertListFilms(film: List<FilmEntity>)

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    fun insertFilm(film: FilmEntity)
}