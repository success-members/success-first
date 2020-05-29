class HomesController < ApplicationController
	def top
		@tax = 1.1 # 税率10%
		@genres = Genre.where(is_valid: true)
		random_products = Product.where(is_sale: true).order(Arel.sql("RAND()"))
		@recommend_products = random_products.last(4).select { |p| p.genre.is_valid }
	end
end
