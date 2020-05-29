class CartItemsController < ApplicationController
	before_action :authenticate_customer!
	before_action :set_tax

	def create
		@cart_item = CartItem.new(cart_item_params)
		@cart_item.customer_id = current_customer.id
		if @cart_item.save
			redirect_to cart_items_path
		else
			render :index
		end
	end

	def index
		@cart_item = CartItem.new
		set_parameter
	end

	def update
		@cart_item = CartItem.find(params[:id])
  		if @cart_item.update(cart_item_params)
  			redirect_to cart_items_path
  		else
  			set_parameter
  			render :index
  		end
	end

	def update_number
		@cart_item = CartItem.find(params[:cart_item][:id])
		@cart_item.number += params[:cart_item][:number].to_i
  		if @cart_item.update(number: @cart_item.number)
  			redirect_to cart_items_path
  		else
  			set_parameter
  			render :index
  		end
	end

	def destroy
		cart_item = CartItem.find(params[:id])
		cart_item.destroy
		redirect_to cart_items_path
	end

	def destroy_all
		cart_item = CartItem.where(customer_id: current_customer.id)
		cart_item.destroy_all
		redirect_to cart_items_path
	end

	private
	def cart_item_params
		params.require(:cart_item).permit(:customer_id, :product_id, :number)
	end

	def set_parameter
		@total_amount = 0
  		@cart_items = CartItem.where(customer_id: current_customer.id)
	end

	def set_tax
		@tax = 1.1 # 税率10%
	end
end
