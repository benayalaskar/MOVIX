package com.benaya.movix.ui.search

import androidx.lifecycle.ViewModel
import androidx.lifecycle.asLiveData
import com.benaya.movix.core.domain.usecase.FilmUseCase
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.debounce
import kotlinx.coroutines.flow.distinctUntilChanged
import kotlinx.coroutines.flow.filter
import kotlinx.coroutines.flow.mapLatest

class SearchViewModel(filmUseCase: FilmUseCase) : ViewModel() {
    val queryChannel = MutableStateFlow("")

    val searchResult = queryChannel
        .debounce(300)
        .distinctUntilChanged()
        .filter {
            it.trim().isNotEmpty()
        }
        .mapLatest {
            filmUseCase.getSearchResult(it).asLiveData()
        }
        .asLiveData()
}