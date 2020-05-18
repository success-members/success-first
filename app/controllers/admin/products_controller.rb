class Admin::ProductsController < ApplicationController

	# 商品新規登録画面
	def new
		@product=Product.new
	end

	def create
		@product = Product.new(product_params)
		@product.save
		redirect_to admin_products_path
	end

	# 商品一覧画面
	def index
	end

	# 商品詳細画面
	def show
	end

	# 商品編集画面
	def edit
	end

	def update
	end

	private
	def product_params
		params.require(:product).permit(:name, :image, :price, :explanation, :is_sale, :genre_id)
	end
end
