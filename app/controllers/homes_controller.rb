class HomesController < ApplicationController
	def top
		@tax = 1.1 # 税率10%
		@genres = Genre.where(is_valid: true)
		random_products = Product.where(is_sale: true).order(Arel.sql("RANDOM()"))
		@recommend_products = random_products.select { |p| p.genre.is_valid }
	end
end
