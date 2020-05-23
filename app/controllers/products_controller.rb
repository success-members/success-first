class ProductsController < ApplicationController
	before_action :authenticate_customer!, except: [:index]

	def index
		@products = Product.where(is_sale: true)
		@genres = Genre.where(is_valid: true)
		if params[:id].present?
			@search_genre = Genre.find(params[:id])
		end
	end

	def show
		@product = Product.find(params[:id])
		@genres = Genre.all
		@cart_item = CartItem.new
		@get_cart_item = CartItem.find_by(customer_id: current_customer.id, product_id: params[:id])
		@pull_num = [1, 2, 3, 4, 5, 10]
	end
end
