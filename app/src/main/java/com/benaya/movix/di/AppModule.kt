package com.benaya.movix.di

import com.benaya.movix.core.domain.usecase.FilmInteractor
import com.benaya.movix.core.domain.usecase.FilmUseCase
import com.benaya.movix.ui.detail.DetailViewModel
import com.benaya.movix.ui.home.HomeViewModel
import com.benaya.movix.ui.search.SearchViewModel
import org.koin.androidx.viewmodel.dsl.viewModel
import org.koin.dsl.module

val useCaseModule = module {
    factory<FilmUseCase> { FilmInteractor(get()) }
}

val viewModelModule = module {
    viewModel { HomeViewModel(get()) }
    viewModel { SearchViewModel(get()) }
    viewModel { DetailViewModel(get()) }
}