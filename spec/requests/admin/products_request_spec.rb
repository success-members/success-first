require 'rails_helper'

RSpec.describe "Admin::Products", type: :request do

	describe '商品一覧画面' do
		context '表示の確認' do
			login_admin

			it '商品一覧画面が正しく表示される' do
				get admin_products_path
				expect(response.status).to eq 200
			end

			it '商品一覧と表示される' do
				visit admin_orders_path
	    		expect(page).to have_content '商品一覧'
	    	end

	    	it '商品IDと表示される' do
	    		visit admin_orders_path
	    		expect(page).to have_content '商品'
	    	end

	    	it '商品名と表示される' do
	    		visit admin_orders_path
	    		expect(page).to have_content '商品名'
	    	end

	    	# it '税抜価格' do
	    	# 	visit admin_orders_path
	    	# 	expect(page).to have_content '税抜価格'
	    	# end

	    	it 'ジャンルと表示される' do
	    		visit admin_orders_path
	    		expect(page).to have_content 'ジャンル'
	    	end

	    	it 'ステータスと表示される' do
	    		visit admin_orders_path
	    		expect(page).to have_content 'ステータス'
	    	end
		end
	end

	describe '商品新規登録画面' do
		context '表示の確認' do
			login_admin

			it '商品新規登録画面が正しく表示される' do
				get new_admin_product_path
				expect(response.status).to eq 200
			end

			it '商品新規登録と表示される' do
	    		visit new_admin_product_path
	    		expect(page).to have_content '商品新規登録'
	    	end

	    	it '商品名と表示される' do
	    		visit new_admin_product_path
	    		expect(page).to have_content '商品名'
	    	end

	    	it '商品説明と表示される' do
	    		visit new_admin_product_path
	    		expect(page).to have_content '商品説明'
	    	end

	    	it 'ジャンルと表示される' do
	    		visit new_admin_product_path
	    		expect(page).to have_content 'ジャンル'
	    	end

	    	it '税抜価格と表示される' do
	    		visit new_admin_product_path
	    		expect(page).to have_content '税抜価格'
	    	end

	    	it '円と表示される' do
	    		visit new_admin_product_path
	    		expect(page).to have_content '円'
	    	end

	    	it '販売ステータスと表示される' do
	    		visit new_admin_product_path
	    		expect(page).to have_content '販売ステータス'
	    	end

	    	it '販売中と表示される' do
	    		visit new_admin_product_path
	    		expect(page).to have_content '販売中'
	    	end

	    	it '新規登録と表示される' do
	    		visit new_admin_product_path
	    		expect(page).to have_content '新規登録'
	    	end
		end
	end

	describe '商品新規登録画面' do
		context '表示の確認' do
			login_admin

			before do
				@product = Product.new(
					name: 'ケーキ',
					image: '',
					price: 1000,
					genre_id: 0,
					explanation: '美味しい',
					is_sale: true
					)
		        @product.save
			end
		end
	end

	describe '商品詳細画面' do
		context '商品情報' do
			login_admin

			before do
				visit new_admin_genre_path
	    		@genre = Genre.new(
	    			name: 'ケーキ',
	    			is_valid: true,
	    			)
				@genre.save

				visit new_admin_product_path
				@product = Product.new(
					name: 'ケーキ',
					image: '',
					price: 1000,
					genre_id: 1,
					explanation: '美味しい',
					is_sale: true
					)
		        @product.save
			end

			it '商品詳細画面が表示される' do
	    		visit admin_product_path(@product)
	  			expect(current_path).to eq('/admin/products/' + @product.id.to_s)
	    	end
		end
	end
end
