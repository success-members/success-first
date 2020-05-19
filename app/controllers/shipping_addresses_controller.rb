class ShippingAddressesController < ApplicationController

	

	def index
		
		@shipping_address_new = ShippingAddress.new
		@customer = current_customer
	    @shipping_addresses = @customer.shipping_addresses
	    				
	end

	def create
		@shipping_address_new = ShippingAddress.new(shipping_address_params)
		@shipping_address_new.customer_id = current_customer.id
		@shipping_address_new.save
		redirect_to shipping_addresses_path(current_customer.id)

	end

	def edit
		@shipping_address = ShippingAddress.find(params[:id])		
	end

	def update
		@shipping_address = ShippingAddress.find(params[:id])
		if @shipping_address.update(shipping_address_params)
	       #flash[:notice] = "配送先の更新が完了しました"  #編集後の完了アラートいる？
           redirect_to shipping_addresses_path(current_customer.id)
        else
           flash[:notice] = "もう一度ご確認の上、ご入力お願いします。" #編集後の完了アラートいる？
           render "edit"
        end

	end

	def destroy
		@shipping_address = ShippingAddress.find(params[:id])
		@shipping_address.destroy
		redirect_to shipping_addresses_path(current_customer.id)
	end

  private #ストロングパラメータ
    def shipping_address_params
      params.require(:shipping_address).permit(:postcode, :address, :name)
    end
end
