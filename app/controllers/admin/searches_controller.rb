class Admin::SearchesController < ApplicationController
	def index		
        customer = Customer.find(params[:customer_id])
		@orders = Order.where(customer_id: customer.id)
	end

	def show
	end

end
