package com.benaya.movix.ui.home

import androidx.lifecycle.ViewModel
import androidx.lifecycle.asLiveData
import com.benaya.movix.core.domain.usecase.FilmUseCase

class HomeViewModel(filmUseCase: FilmUseCase) : ViewModel() {
    val film = filmUseCase.getAllFilm().asLiveData()
}