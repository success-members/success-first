class OrdersController < ApplicationController
	def new
		@shipping_address = ShippingAddress.where(customer_id: current_customer.id)
	end
end
