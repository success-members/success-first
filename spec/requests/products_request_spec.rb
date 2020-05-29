require 'rails_helper'

RSpec.describe "Products", type: :request do

	describe '商品一覧画面' do
		context '表示の確認' do
			# login_customer

			it '商品一覧画面が正しく表示される' do
				get products_path
				expect(response.status).to eq 200
			end

			it 'ジャンル検索と表示される' do
				visit products_path
	    		expect(page).to have_content 'ジャンル検索'
	    	end

	    	it '商品一覧と表示される' do
	    		visit products_path
	    		expect(page).to have_content '商品一覧'
	    	end

	    	it '全と表示される' do
	    		visit products_path
	    		expect(page).to have_content '全'
	    	end

	    	it '件と表示される' do
	    		visit products_path
	    		expect(page).to have_content '件'
	    	end
		end
	end
end
