class Admin::OrderProductsController < ApplicationController

	def order_products
		@order_product = OrderProduct.find(params[:id])
	end

	def update
		@order_product = OrderProduct.find(params[:id])
		@order_product.update(order_product_params)
		redirect_to admin_order_path(@order_product.order)
	end

	private
	def order_product_params
		params.require(:order_product).permit(:making_status)
	end
end
