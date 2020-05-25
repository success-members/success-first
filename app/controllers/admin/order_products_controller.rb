class Admin::OrderProductsController < ApplicationController

	def order_products
		@order_product = OrderProduct.find(params[:id])
	end

	
	#def update
		#@order_product = OrderProduct.find(params[:id])
		#if @order_product.update(order_product_params)
			#if @order_product.making_status_before_type_cast == 3
				#@order_product.order.update(order_status: 3)
				#redirect_to admin_order_path(@order_product.order)
			#elsif @order_product.making_status_before_type_cast == 2
				#@order_product.order.update(order_status: 2)
				#redirect_to admin_order_path(@order_product.order)
			#else
				#redirect_to admin_order_path(@order_product.order)
			#end
		#else
			#redirect_to admin_order_path(@order_product.order)
		#end
	#end
    

	private
	def order_product_params
		params.require(:order_product).permit(:making_status)
	end
end
