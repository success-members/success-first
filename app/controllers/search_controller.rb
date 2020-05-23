class SearchController < ApplicationController

	def searches

		@product_or_customer = params[:option]		
		@how_search = params[:choice] 
		if @product_or_customer == "1"
		   @products = Product.search(params[:search], @product_or_customer, @how_search)
		else
		   @customers = Customer.search(params[:search], @product_or_customer, @how_search)
		   #@customer = Customer.find(params[:id])
		end
        render "searches"
	end
end
