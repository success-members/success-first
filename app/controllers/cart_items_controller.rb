class CartItemsController < ApplicationController
	before_action :authenticate_customer!

	def create
		@cart_item = CartItem.new(cart_item_params)
		@cart_item.customer_id = current_customer.id
		@cart_item.save
		redirect_to cart_items_path
	end

	def index
		@total_amount = 0
		@cart_items = CartItem.all
	end

	def update
		cart_item = CartItem.find(params[:id])
  	cart_item.update(cart_item_params)
  	redirect_to cart_items_path
	end

	def update_number
		cart_item = CartItem.find(params[:cart_item][:id])
		cart_item.number += params[:cart_item][:number].to_i
  	cart_item.update(number: cart_item.number)
  	redirect_to cart_items_path
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
end
