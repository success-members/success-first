class OrdersController < ApplicationController
	before_action :authenticate_customer!

	def new
		@shipping_address = ShippingAddress.where(customer_id: current_customer.id)
		@order = Order.new
	end

	def confirm
		@POSTAGE = 800
		@total_amount = 0
		@order = Order.new
		@order.payment_method = params[:order][:payment_method].to_i
		@order_products = OrderProduct.new
		@cart_items = CartItem.where(customer_id: current_customer.id)
		receive_addressee = params
		receive_order = params.require(:order)
		if receive_addressee[:addressee].to_i == 0
			@postcode = current_customer.postcode
			@address = current_customer.address
			@name = current_customer.last_name + current_customer.first_name
		elsif receive_addressee[:addressee].to_i == 1
			@postcode = receive_order[:billing].split[0]
			@address = receive_order[:billing].split[1]
			@name = receive_order[:billing].split[2]
		elsif receive_addressee[:addressee].to_i == 2
			@postcode = receive_order[:postcode]
			@address = receive_order[:address]
			@name = receive_order[:name]
		end
	end

	def create
		order = Order.new(order_params)
		order.customer_id = current_customer.id
		order.save
		cart_items = CartItem.where(customer_id: current_customer.id)
		cart_items.each do |cart_item|
			order_product = OrderProduct.new
			order_product.order_id = order.id
			order_product.product_id = cart_item.product_id
			order_product.unit_price = cart_item.product.price
			order_product.number = cart_item.number
			order_product.save
		end
		cart_items.destroy_all
		redirect_to thanks_orders_path
	end

	def thanks
	end

	def index
		@orders = Order.where(customer_id: current_customer.id)
	end

	def show
	end

	private
	def order_params
		params.require(:order).permit(:payment_method, :postage, :billing, :postcode, :address, :name)
	end
end
