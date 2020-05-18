class CartItemsController < ApplicationController
	def create
		@cart_item = CartItem.new(cart_item_params)
		@cart_item.customer_id = 1
		@cart_item.save
		redirect_to cart_items_path
	end

	def index
		@total_amount = 0
		@cart_items = CartItem.all

	end

	private
	def cart_item_params
		params.require(:cart_item).permit(:customer_id, :product_id, :number)
	end
end
