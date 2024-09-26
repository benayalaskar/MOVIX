package com.benaya.movix.ui.detail

import androidx.lifecycle.ViewModel
import com.benaya.movix.core.domain.model.Film
import com.benaya.movix.core.domain.usecase.FilmUseCase

class DetailViewModel(private val filmUseCase: FilmUseCase) : ViewModel() {
    fun setFavoriteFilm(film: Film, newStatus: Boolean) =
        filmUseCase.setFavoriteFilm(film, newStatus)
}