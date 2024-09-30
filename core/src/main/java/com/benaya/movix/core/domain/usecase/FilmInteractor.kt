package com.benaya.movix.core.domain.usecase

import com.benaya.movix.core.domain.model.Film
import com.benaya.movix.core.domain.repository.IFilmRepository

class FilmInteractor(private val filmRepository: IFilmRepository) : FilmUseCase {

    override fun getAllFilm() = filmRepository.getAllFilm()

    override fun getFavoriteFilm() = filmRepository.getAllFavoriteFilm()

    override fun setFavoriteFilm(film: Film, state: Boolean) =
        filmRepository.setFavoriteFilm(film, state)

    override fun getSearchResult(q: String) = filmRepository.getSearchMovie(q)

}