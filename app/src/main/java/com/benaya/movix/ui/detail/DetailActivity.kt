package com.benaya.movix.ui.detail

import android.os.Bundle
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import androidx.appcompat.widget.Toolbar
import androidx.core.content.ContextCompat
import com.benaya.movix.R
import com.benaya.movix.core.domain.model.Film
import com.benaya.movix.databinding.ActivityDetailBinding
import com.bumptech.glide.Glide
import org.koin.androidx.viewmodel.ext.android.viewModel

class DetailActivity : AppCompatActivity() {
    private lateinit var binding: ActivityDetailBinding
    private val detailViewModel: DetailViewModel by viewModel()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityDetailBinding.inflate(layoutInflater)
        setContentView(binding.root)
        window.statusBarColor = resources.getColor(R.color.status_bar_color, theme)
        val toolbar: Toolbar = findViewById(R.id.toolbar)
        setSupportActionBar(toolbar)
        supportActionBar?.setDisplayShowTitleEnabled(false)

        @Suppress("DEPRECATION")
        val data = intent.getParcelableExtra<Film>(DATA)

        if (data != null) {
            binding.filmTitle.text = data.title
            binding.filmVote.text = getString(R.string.vote_average, data.vote)
            binding.filmReleaseDate.text = getString(R.string.release_date, data.releaseDate)
            Glide.with(this).load("https://image.tmdb.org/t/p/w500/${data.image}")
                .into(binding.filmImage)
            binding.descriptionText.text = data.overview
        }

        binding.arrowBack.setOnClickListener {
            onBackPressed()
        }

        var statusFavorite = data?.isFavorite as Boolean
        setStatusFavorite(statusFavorite, false)
        binding.fabFav.setOnClickListener {
            statusFavorite = !statusFavorite
            detailViewModel.setFavoriteFilm(data, statusFavorite)
            setStatusFavorite(statusFavorite, true)
        }

        // Add scroll listener to show/hide the favorite button when user scrolling the detail page
        binding.scrollView.setOnScrollChangeListener { _, _, scrollY, _, oldScrollY ->
            if (scrollY > oldScrollY) {
                binding.fabFav.hide()
            } else if (scrollY < oldScrollY) {
                binding.fabFav.show()
            }
        }
    }

    private fun setStatusFavorite(statusFavorite: Boolean, onClick: Boolean) {
        if (statusFavorite) {
            binding.fabFav.setImageDrawable(
                ContextCompat.getDrawable(
                    this,
                    R.drawable.baseline_favorite_24
                )
            )
            if (onClick) Toast.makeText(this, "Successfully added favorite", Toast.LENGTH_SHORT)
                .show()
        } else {
            binding.fabFav.setImageDrawable(
                ContextCompat.getDrawable(
                    this,
                    R.drawable.baseline_favorite_border_24
                )
            )
            if (onClick) Toast.makeText(this, "Successfully removed favorite", Toast.LENGTH_SHORT)
                .show()
        }
    }

    companion object {
        private const val DATA = "data_detail"
    }
}