class Admin::ProductsController < ApplicationController
	
	before_action :authenticate_admin!

	# 商品新規登録画面
	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)
		if @product.save
			redirect_to admin_product_path(@product)
		else
			@products = Product.all
			render :new
		end
	end

	# 商品一覧画面
	def index
		@products = Product.page(params[:page]).reverse_order
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
		params.require(:product).permit(:name, :image, :price, :genre_id, :explanation, :is_sale)
	end
end
