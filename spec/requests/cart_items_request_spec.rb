require 'rails_helper'

RSpec.describe "CartItems", type: :request do

	describe 'カート画面' do
		context '表示の確認' do
			login_customer

			it 'カート画面が正しく表示される' do
				get cart_items_path
				expect(response.status).to eq 200
			end

			it 'ショッピングカートと表示される' do
				visit cart_items_path
	    		expect(page).to have_content 'ショッピングカート'
	    	end

	    	it '商品名と表示される' do
	    		visit cart_items_path
	    		expect(page).to have_content '商品名'
	    	end

	    	it '単価(税込)と表示される' do
	    		visit cart_items_path
	    		expect(page).to have_content '単価(税込)'
	    	end

	    	it '数量と表示される' do
	    		visit cart_items_path
	    		expect(page).to have_content '数量'
	    	end

	    	it '小計と表示される' do
	    		visit cart_items_path
	    		expect(page).to have_content '小計'
	    	end

	    	it '合計金額と表示される' do
	    		visit cart_items_path
	    		expect(page).to have_content '合計金額'
	    	end
	    end
	end
end