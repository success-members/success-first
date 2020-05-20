class Admin::CustomersController < ApplicationController

	# 会員一覧画面
	def index
		@customers = Customer.all
	end

	# 会員詳細画面
	def show
		@customer = Customer.find(params[:id])
	end

	# 会員編集画面
	def edit
		@customer = Customer.find(params[:id])
	end

	# 会員登録情報の更新をする
	def update
		@customer = Customer.find(params[:id])
		if @customer.update(customer_params)
			redirect_to admin_customer_path
		else
			@customer = Customer.find(params[:id])
			render :edit
		end
	end

	private
	def customer_params
		params.require(:customer).permit(:email)
		# :last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postcode, :address, :phone_number, :is_deleted
	end
end
