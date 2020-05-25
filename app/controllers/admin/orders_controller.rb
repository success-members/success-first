class Admin::OrdersController < ApplicationController

	def index
		@orders = Order.all

	end

	def show
		@order = Order.find(params[:id])
		@order_product = OrderProduct.find(params[:id])
		@total_amount = @order.billing - @order.postage
	end

	#def update
		#@order = Order.find(params[:id])
		  #@order.update(order_params)
		#redirect_to admin_order_path(@order)
	#end

	def update
		@order = Order.find(params[:id])
		  if @order.update(order_params)
		  	if @order.order_status_before_type_cast == 1
				@order.order_products.update(making_status: 1)
				redirect_to admin_order_path(@order)
			else
				redirect_to admin_order_path(@order)
			end
		else
			redirect_to admin_order_path(@order)
		end
	end

	private
	def order_params
		params.require(:order).permit(:order_status)
	end

end
