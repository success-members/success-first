class Admin::OrdersController < ApplicationController

	before_action :authenticate_admin!

	def index
		if params[:id]
			@orders = Order.where(customer_id: params[:id])
		else
			@orders = Order.all
		end
	end

	def show
		@order = Order.find(params[:id])
		@total_amount = @order.billing - @order.postage
	end

	#def update
		#@order = Order.find(params[:id])
		  #@order.update(order_params)
		#redirect_to admin_order_path(@order)
	#end

	def update
		@order = Order.find(params[:id])
		  #if @order.update(order_params)
		  	#if @order.order_status_before_type_cast == 1
				#@order.order_products.update(making_status: 1)
				#redirect_to admin_order_path(@order)
			#else
				#redirect_to admin_order_path(@order)
			#end
		#else
			#redirect_to admin_order_path(@order)
		#end
		@order.update(order_params)
		if @order.order_status_before_type_cast == 1
			@order.order_products.each do |op|
				op.update(making_status: 1)
			end
		end
		redirect_to admin_order_path(@order)
	end

	private
	def order_params
		params.require(:order).permit(:order_status)
	end

end
