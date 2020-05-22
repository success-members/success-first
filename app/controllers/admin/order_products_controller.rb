class Admin::OrderProductsController < ApplicationController
	def index
		@products = Product.all
	end
	private
	def product_params
		params.require(:product).permit(:name, :is_sale)
	end
end
