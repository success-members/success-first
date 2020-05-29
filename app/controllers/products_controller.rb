class ProductsController < ApplicationController
	before_action :authenticate_customer!, except: [:index]
	before_action :set_tax

	def index
		@products = Product.page(params[:page]).where(is_sale: true).reverse_order
		@genres = Genre.where(is_valid: true)
		if params[:id].present?
			@search_genre = Genre.find(params[:id])
		end
	end

	def show
		@product = Product.find(params[:id])
		@genres = Genre.where(is_valid: true)
		@cart_item = CartItem.new
		@get_cart_item = CartItem.find_by(customer_id: current_customer.id, product_id: params[:id])
		@pull_num = [1, 2, 3, 4, 5, 10]
	end

	def set_tax
		@tax = 1.1 # 税率10%
	end

end
