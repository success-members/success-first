class Admin::ProductsController < ApplicationController

	# 商品新規登録画面
	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)
		if @product.save
			redirect_to admin_product_path(@product)
		else
			@product = Product.new(product_params)
			render :new
		end
	end

	# 商品一覧画面
	def index
		@products = Product.all
	end

	# 商品詳細画面
	def show
		@product = Product.find(params[:id])
	end

	# 商品編集画面
	def edit
		@product = Product.find(params[:id])
	end

	def update
		@product = Product.find(params[:id])
		if @product.update(product_params)
			redirect_to admin_product_path
		else
			@product = Product.find(params[:id])
			render :edit
		end
	end

	private
	def product_params
		params.require(:product).permit(:name, :image, :price, :explanation, :is_sale) # :image,  :genre_id
	end
end
