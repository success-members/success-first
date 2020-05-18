class ProductsController < ApplicationController
	def index
		@products = Product.all
		@genres = Genre.all
		if params[:id].present?
			@search_genre = Genre.find(params[:id])
		end
	end

	def show
		@product = Product.find(params[:id])
		@genres = Genre.all
		@cart_item = CartItem.new

		@pull_num = {"1": 1, "2": 2, "3": 3, "4": 4, "5": 5, "10": 10}
	end
end
