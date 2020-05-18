class Admins::GenresController < ApplicationController

	# ジャンル登録・一覧画面
	def new
		@genres = Genre.all
		@genre = Genre.new
	end

	# ジャンルの新規登録をする
	def create
		@genre = Genre.new(genre_params)
		@genre.save
		redirect_to new_admins_genre_path
	end

	# ジャンル編集画面
	def edit
		@genre = Genre.find(1)
	end

	# ジャンルの更新をする
	def update
		@genre = Genre.find(1)
		@genre.update(genre_params)
		redirect_to new_admins_genre_path
	end


	private
	def genre_params
		params.permit(:name, :is_valid)
	end
end
