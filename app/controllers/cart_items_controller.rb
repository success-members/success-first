class CartItemsController < ApplicationController
	def create
		@cart_item = CartItem.new(cart_item_params)
		# TODO @cart_item.customer_id = current_user # 会員のログイン画面のブランチがマージされたらコメントアウト
		@cart_item.customer_id = 1
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

	def destroy
		cart_item = CartItem.find(params[:id])
		cart_item.destroy
		redirect_to cart_items_path
	end

	def destroy_all
		# TODO cart_item = CartItem.where(customer_id: current_user) # 会員のログイン画面のブランチがマージされたらコメントアウト
		cart_item = CartItem.where(customer_id: 1)
		cart_item.destroy_all
		redirect_to cart_items_path
	end

	private
	def cart_item_params
		params.require(:cart_item).permit(:customer_id, :product_id, :number)
	end
end
