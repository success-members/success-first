class OrdersController < ApplicationController
	before_action :authenticate_customer!

	def new
		@shipping_address = ShippingAddress.where(customer_id: current_customer.id)
		@order = Order.new
	end

	def confirm
		@order = params.require(:order)
		@receive_param = params
		@cart_items = CartItem.where(customer_id: current_customer)
		@total_amount = 0
		@POSTAGE = 800
	end

	private
	def order_params
		params.require(:order).permit(:postcode, :address, :name, :payment_method)
	end
end
