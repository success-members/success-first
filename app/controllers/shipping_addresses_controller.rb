class ShippingAddressesController < ApplicationController

	def new
		@shipping_address = Shipping_address.new
	end

	def index
		@shipping_address_new = ShippingAddress.new
		@shipping_address = ShippingAddress.find(params[:id])
		@shipping_addresses = ShippingAddress.all
		
	end

	def edit
		@shipping_address = ShippingAddress.find(params[:id])
		
	end

	def update
		
	end

	def destroy
		
	end

  private #ストロングパラメータ
    def shipping_address_params
      params.require(:shipping_address).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postcode, :address, :phone_number, :password, :password_confirmation)
    end
end
