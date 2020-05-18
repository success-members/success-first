class CustomersController < ApplicationController

	def show #マイページ表示
		@customer = Customer.find(params[:id])
		
	end

	

	def edit
		@customer = Customer.find(params[:id])
		
	end

	def update	#登録者情報の更新
	    @customer = Customer.find(params[:id])	
	end

	def update_retire	#退会手続き（ステータスの更新）	
	end

	def withdrawal #退会画面		
	end


	private #ストロングパラメータ
	  def customer_params
	      params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postcode, :address, :phone_number, :password, :password_confirmation)
	  end

	
end
