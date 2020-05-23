class SearchController < ApplicationController

	def search
		@product = params[:option]		
		@how_search = params[:choice] 
		if @product == "1"
		   @products = Product.search(params[:search], @product, @how_search)
		else
		   @products = Product.search(params[:search], @product, @how_search)
		end

        render "search"
	end
end
