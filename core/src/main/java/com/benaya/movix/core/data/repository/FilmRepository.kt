@file:Suppress("VerboseNullabilityAndEmptiness", "LocalVariableName")

package com.benaya.movix.core.data.repository

import com.benaya.movix.core.data.NetworkBoundResource
import com.benaya.movix.core.data.Resource
import com.benaya.movix.core.data.source.local.LocalDataSource
import com.benaya.movix.core.data.source.remote.RemoteDataSource
import com.benaya.movix.core.data.source.remote.network.ApiResponse
import com.benaya.movix.core.data.source.remote.response.ResultsItem
import com.benaya.movix.core.domain.model.Film
import com.benaya.movix.core.domain.repository.IFilmRepository
import com.benaya.movix.core.utils.AppExecutors
import com.benaya.submissionandrofilmIdexpert.core.utils.DataMapper
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.map

@Suppress("LocalVariableName")
class FilmRepository(
    private val remoteDataSource: RemoteDataSource,
    private val localDataSource: LocalDataSource,
    private val appExecutors: AppExecutors
) : IFilmRepository {

    override fun getAllFilm(): Flow<Resource<List<Film>>> =
        object : NetworkBoundResource<List<Film>, List<ResultsItem>>(appExecutors) {
            override fun loadFromDB(): Flow<List<Film>> {
                return localDataSource.getAllNonFavoriteFilms()
                    .map { DataMapper.mapEntitiesToDomain(it) }
            }

            override fun shouldFetch(data: List<Film>?): Boolean = data == null || data.isEmpty()

            override suspend fun createCall(): Flow<ApiResponse<List<ResultsItem>>> =
                remoteDataSource.getAllPopularMovie()

            override suspend fun saveCallResult(data: List<ResultsItem>) {
                val FilmList = DataMapper.mapResponsesToEntities(data)
                localDataSource.insertListFilms(FilmList)
            }
        }.asFlow()

    override fun getSearchMovie(q: String): Flow<Resource<List<Film>>> =
        remoteDataSource.searchMovie(q)

    override fun getAllFavoriteFilm(): Flow<List<Film>> {
        return localDataSource.getFavoriteFilm().map {
            DataMapper.mapEntitiesToDomain(it)
        }
    }

    override fun setFavoriteFilm(film: Film, state: Boolean) {
        val filmEntity = DataMapper.mapDomainToEntity(film)
        appExecutors.diskIO().execute { localDataSource.setFavoriteFilm(filmEntity, state) }
    }
}