class Admin::GenresController < ApplicationController

	#before_action :authenticate_admin!

	# ジャンル登録・一覧画面
	def new
		@genres = Genre.all
		@genre = Genre.new
	end

	# ジャンルの新規登録をする
	def create
		@genre = Genre.new(genre_params)
		if @genre.save
			redirect_to new_admin_genre_path
		else
			@genres = Genre.all
			redirect_to new_admin_genre_path
		end

	end

	# ジャンル編集画面
	def edit
		@genre = Genre.find(params[:id])
	end

	# ジャンルの更新をする
	def update
		@genre = Genre.find(params[:id])
		if @genre.update(genre_params)
			redirect_to new_admin_genre_path
		else
			@genre = Genre.find(params[:id])
			render :edit
		end
	end


	private
	def genre_params
		params.require(:genre).permit(:name, :is_valid)
	end

end
