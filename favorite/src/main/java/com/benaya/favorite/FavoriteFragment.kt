package com.benaya.favorite

import android.annotation.SuppressLint
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import androidx.recyclerview.widget.LinearLayoutManager
import com.benaya.favorite.databinding.FragmentFavoriteBinding
import com.benaya.movix.core.ui.FilmAdapter
import com.benaya.movix.di.favoriteModule
import org.koin.androidx.viewmodel.ext.android.viewModel
import org.koin.core.context.loadKoinModules

class FavoriteFragment : Fragment() {

    private val favoriteViewModel: FavoriteViewModel by viewModel()

    private var _binding: FragmentFavoriteBinding? = null
    private val binding get() = _binding as FragmentFavoriteBinding

    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View {
        _binding = FragmentFavoriteBinding.inflate(inflater, container, false)
        return binding.root
    }

    @SuppressLint("SetTextI18n")
    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        loadKoinModules(favoriteModule)

        val adapter = FilmAdapter()
        binding.rvFilm.adapter = adapter
        val layoutManager = LinearLayoutManager(requireActivity())
        binding.rvFilm.layoutManager = layoutManager

        favoriteViewModel.favoriteFilm.observe(viewLifecycleOwner) { result ->
            if (result.isEmpty()) {
                binding.favText.text = "Try to add some favorite movies!"
            } else {
                binding.favText.text = ""
            }
            adapter.submitList(result)
        }

    }

    override fun onDestroyView() {
        super.onDestroyView()
        _binding = null
    }
}