require 'rails_helper'

RSpec.describe Genre, type: :model do
	context "データが正しく保存される" do
	  	before do
	  		@genre = Genre.new
	  		@genre.name = "ケーキ"
	  		@genre.is_valid = true
			@genre.save
		end
		it "全て入力してあるので保存される" do
			expect(@genre).to be_valid
		end
	end
end
