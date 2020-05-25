class Admin::OrderProductsController < ApplicationController

	def order_products
		@order_product = OrderProduct.find(params[:id])
	end

	def update
		@order_product = OrderProduct.find(params[:id])
		@order_product.update(order_product_params)
		@order = @order_product.order
		discrimination = @order.order_products.distinct.pluck(:making_status)
		if @order_product.making_status_before_type_cast == 2
			@order.update(order_status: 2)
		elsif discrimination.include?("製作完了") && discrimination.count == 1
			@order.update(order_status: 3)
		end
		redirect_to admin_order_path(@order_product.order)
	end

	private
	def order_product_params
		params.require(:order_product).permit(:making_status)
	end
end
