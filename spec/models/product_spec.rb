require 'rails_helper'

RSpec.describe Product, type: :model do
	context "データが正しく保存される" do
	  	before do
	  		@product = Product.new
	  		@product.name = "ケーキ"
	  		@product.price = 1000
	  		@product.explanation = "ケーキ"

			@product.save
		end
		it "全て入力してあるので保存される" do
			expect(@product).to be_valid
		end
	end
end
