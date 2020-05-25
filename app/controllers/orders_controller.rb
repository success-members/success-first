class OrdersController < ApplicationController
	before_action :authenticate_customer!
	before_action :set_tax

	def new
		@shipping_address = ShippingAddress.where(customer_id: current_customer.id)
		@order = Order.new
		@cart_items = CartItem.where(customer_id: current_customer.id)
		if @cart_items.blank?
			@cart_item = CartItem.new
			@total_amount = 0
			@error_msg = "カートに商品が入っていません"
			render template: "cart_items/index"
		end
	end

	def confirm
		@POSTAGE = 800
		@total_amount = 0
		@order = Order.new
		@order.payment_method = params[:order][:payment_method].to_i
		@order_products = OrderProduct.new
		@cart_items = CartItem.where(customer_id: current_customer.id)
		@receive_addressee = params[:addressee].to_i
		receive_order = params.require(:order)
		if @receive_addressee == 0
			@postcode = current_customer.postcode
			@address = current_customer.address
			@name = current_customer.last_name + current_customer.first_name
		elsif @receive_addressee == 1
			if receive_order[:billing]
				@postcode = receive_order[:billing].split[0]
				@address = receive_order[:billing].split[1]
				@name = receive_order[:billing].split[2]
			end
		elsif @receive_addressee == 2
			@postcode = receive_order[:postcode]
			@address = receive_order[:address]
			@name = receive_order[:name]
		end
	end

	def create
		receive_param = params[:addressee].to_i
		@order = Order.new(order_params)
		@order.customer_id = current_customer.id
		if @order.save
			cart_items = CartItem.where(customer_id: current_customer.id)
			if receive_param == 2
				add_shipping = ShippingAddress.new
				add_shipping.customer_id = current_customer.id
				add_shipping.postcode = @order.postcode
				add_shipping.address = @order.address
				add_shipping.name = @order.name
				unless add_shipping.save
					@shipping_address = ShippingAddress.where(customer_id: current_customer.id)
					render :new
				end
			end
			cart_items.each do |cart_item|
				order_product = OrderProduct.new
				order_product.order_id = @order.id
				order_product.product_id = cart_item.product_id
				order_product.unit_price = cart_item.product.price
				order_product.number = cart_item.number
				order_product.save
			end
			cart_items.destroy_all
			redirect_to thanks_orders_path
		else
			@shipping_address = ShippingAddress.where(customer_id: current_customer.id)
			render :new
		end
	end

	def thanks
	end

	def index
		customer = Customer.find(params[:customer_id])
		@orders = Order.where(customer_id: customer.id)

	end

	def show
		@order = Order.find(params[:id])
		@total_amount = @order.billing - @order.postage
	end

	private
	def order_params
		params.require(:order).permit(:payment_method, :postage, :billing, :postcode, :address, :name)
	end

	def set_tax
		@tax = 1.1 # 税率10%
	end
end
