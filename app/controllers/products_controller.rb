class ProductsController < ApplicationController
	def index
		@products = Product.all
		@genres = Genre.all
	end

	def show
	end
end
