package com.benaya.movix.di

import com.benaya.favorite.FavoriteViewModel
import org.koin.androidx.viewmodel.dsl.viewModel
import org.koin.dsl.module

val favoriteModule = module {
    viewModel { FavoriteViewModel(get()) }
}