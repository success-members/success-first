class OrdersController < ApplicationController
	def new
		@shipping_address = ShippingAddress.where(customer_id: current_customer.id)
		@order = Order.new
	end

	def confirm
		@order = params.require(:order)
		@oo = params
		# @order = ShippingAddress.new(order_params)
	end

	private
	def order_params
		params.require(:order).permit(:postcode, :address, :name)
	end
end
