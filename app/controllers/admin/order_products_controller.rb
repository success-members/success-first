class Admin::OrderProductsController < ApplicationController

	def order_products
		@order_product = OrderProduct.find(params[:id])
	end

	def update
		@order_product = OrderProduct.find(params[:id])
	end

	private
	def product_params
		params.require(:order_products).permit(:making_status)
	end
end
