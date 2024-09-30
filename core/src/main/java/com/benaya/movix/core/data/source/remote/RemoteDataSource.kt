package com.benaya.movix.core.data.source.remote

import android.util.Log
import com.benaya.core.BuildConfig
import com.benaya.submissionandrofilmIdexpert.core.utils.DataMapper
import com.benaya.movix.core.data.Resource
import com.benaya.movix.core.data.source.remote.network.ApiResponse
import com.benaya.movix.core.data.source.remote.network.ApiService
import com.benaya.movix.core.data.source.remote.response.ResultsItem
import com.benaya.movix.core.domain.model.Film
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.flow
import kotlinx.coroutines.flow.flowOn

class RemoteDataSource(private val apiService: ApiService) {

    suspend fun getAllPopularMovie(): Flow<ApiResponse<List<ResultsItem>>> {
        return flow {
            try {
                val response = apiService.getList(BuildConfig.API_KEY)
                val dataArray = response.results
                Log.d("RemoteData", dataArray.toString())
                if (dataArray.isNotEmpty()) {
                    emit(ApiResponse.Success(response.results))
                } else {
                    emit(ApiResponse.Empty)
                }
            } catch (e: Exception) {
                emit(ApiResponse.Error(e.toString()))
                Log.e("RemoteDataSource", e.toString())
            }
        }.flowOn(Dispatchers.IO)
    }

    fun searchMovie(q: String): Flow<Resource<List<Film>>> = flow {
        try {
            val response = apiService.getSearchMovie(BuildConfig.API_KEY, q)
            val dataArray = response.results

            val movie = DataMapper.mapResponseToDomain(dataArray)
            emit(Resource.Success(movie))
        } catch (e: Exception) {
            emit(Resource.Error(e.toString()))
            Log.e("RemoteDataSource", "messageError: $e")
        }
    }
}