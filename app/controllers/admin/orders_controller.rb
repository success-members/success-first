class Admin::OrdersController < ApplicationController

	def index
		@orders = Order.all

	end

	def show
		@order = Order.find(params[:id])
		@order_product = OrderProduct.find(params[:id])
		@total_amount = @order.billing - @order.postage
	end

	def update
		@order = Order.find(params[:id])
		  @order.update(order_params)
	end

	private
	def order_params
		params.require(:order).permit(:order_status)
	end

end
