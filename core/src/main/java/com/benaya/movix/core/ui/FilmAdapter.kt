package com.benaya.movix.core.ui

import android.content.Intent
import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.DiffUtil
import androidx.recyclerview.widget.ListAdapter
import androidx.recyclerview.widget.RecyclerView
import com.benaya.core.databinding.ItemFilmBinding
import com.benaya.movix.core.domain.model.Film
import com.bumptech.glide.Glide

@Suppress("MemberVisibilityCanBePrivate")
class FilmAdapter : ListAdapter<Film, FilmAdapter.MyViewHolder>(DIFF_CALLBACK) {

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): MyViewHolder {
        val binding = ItemFilmBinding.inflate(LayoutInflater.from(parent.context), parent, false)
        return MyViewHolder(binding)
    }

    override fun onBindViewHolder(holder: MyViewHolder, position: Int) {
        val item = getItem(position)
        holder.bind(item)
    }

    class MyViewHolder(val binding: ItemFilmBinding) : RecyclerView.ViewHolder(binding.root) {
        fun bind(item: Film) {
            binding.filmTitle.text = item.title
            Glide.with(itemView.context).load("https://image.tmdb.org/t/p/w500/${item.image}")
                .into(binding.filmImage)
            itemView.setOnClickListener {
                val intent = Intent(
                    itemView.context,
                    Class.forName("com.benaya.movix.ui.detail.DetailActivity")
                )
                intent.putExtra(DATA, item)
                itemView.context.startActivity(intent)
            }
        }
    }

    companion object {
        private const val DATA = "data_detail"

        val DIFF_CALLBACK = object : DiffUtil.ItemCallback<Film>() {
            override fun areItemsTheSame(oldItem: Film, newItem: Film): Boolean {
                return oldItem == newItem
            }

            override fun areContentsTheSame(oldItem: Film, newItem: Film): Boolean {
                return oldItem == newItem
            }
        }
    }
}