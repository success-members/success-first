class CustomersController < ApplicationController

	def show #マイページ表示
		@customer = Customer.find(params[:id])
		
	end

	

	def edit
		@customer = Customer.find(params[:id])
		
	end

	def update	#登録者情報の更新
	    @customer = Customer.find(params[:id])
	    if @customer.update(customer_params)
	       #flash[:notice] = "登録者の更新が完了しました"  #編集後の完了アラートいる？
           redirect_to customer_path(current_customer.id)
        else
           flash[:notice] = "もう一度ご確認の上、ご入力お願いします。" #編集後の完了アラートいる？
           render "edit"
        end
	end

	def withdrawal
		@customer = Customer.find(params[:id])
		
	end

	def update_retire	#退会手続き（ステータスの更新）
	    @customer = Customer.find(params[:id])
        @customer.update(is_deleted: false)	#is_deletedをtrueに変更することでユーザーの倫理削除可能？
        reset_session
        flash[:notice] = "ありがとうございました。またのご利用お待ちしております。"
        redirect_to root_path
	end

	


	private #ストロングパラメータ
	  def customer_params
	      params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postcode, :address, :phone_number, :password, :password_confirmation)
	  end

	
end
