package com.benaya.favorite

import androidx.lifecycle.ViewModel
import androidx.lifecycle.asLiveData
import com.benaya.movix.core.domain.usecase.FilmUseCase

class FavoriteViewModel(filmUseCase: FilmUseCase) : ViewModel() {
    val favoriteFilm = filmUseCase.getFavoriteFilm().asLiveData()
}