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

		context 'フォームのテスト' do
			login_admin

			before do
				visit new_admin_genre_path
	    		@genre = Genre.new(
	    			name: 'ケーキ',
	    			is_valid: true,
	    			)
				@genre.save
			end

			# it '画像の登録' do
	  #   		visit new_admin_product_path
	  #   		fill_in 'product[image]', with: ''
	  #   	end

			it '商品名の登録' do
	    		visit new_admin_product_path
	    		fill_in 'product[name]', with: Faker::Lorem.characters(number:5)
	    	end

	    	it '商品説明の登録' do
	    		visit new_admin_product_path
	    		fill_in 'product[explanation]', with: Faker::Lorem.characters(number:10)
	    	end

	    	it '税抜価格の登録' do
	    		visit new_admin_product_path
	    		fill_in 'product[price]', with: Faker::Number.number
	    	end

	    	it 'ジャンルの登録' do
	    		visit new_admin_product_path
	    		select 'ケーキ'
	    	end

	    	it '販売ステータスが表示される' do
	    		visit new_admin_product_path
	    		select '販売中'
	    	end

	    	it '販売ステータスが表示される' do
	    		visit new_admin_product_path
	    		select '売切れ'
	    	end

	    	# it '「新規登録」をクリックすることができる' do
	    	# 	visit new_admin_product_path
	    	# 	click_on '新規登録'
	    	# end
		end
	end

	describe '商品詳細画面' do
		context '項目の表示' do
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

	    	it '商品詳細と表示される' do
	    		visit admin_product_path(@product)
	    		expect(page).to have_content '商品詳細'
	    	end

	    	it '商品名と表示される' do
	    		visit admin_product_path(@product)
	    		expect(page).to have_content '商品名'
	    	end

	    	it '商品説明と表示される' do
	    		visit admin_product_path(@product)
	    		expect(page).to have_content '商品説明'
	    	end

	    	it 'ジャンルと表示される' do
	    		visit admin_product_path(@product)
	    		expect(page).to have_content 'ジャンル'
	    	end

	    	it '税抜価格と表示される' do
	    		visit admin_product_path(@product)
	    		expect(page).to have_content '税抜価格'
	    	end

	    	it '円と表示される' do
	    		visit admin_product_path(@product)
	    		expect(page).to have_content '円'
	    	end

	    	it '販売ステータスと表示される' do
	    		visit admin_product_path(@product)
	    		expect(page).to have_content '販売ステータス'
	    	end

	    	it '販売中と表示される' do
	    		visit admin_product_path(@product)
	    		expect(page).to have_content '販売中'
	    	end

	    	it '編集すると表示される' do
	    		visit admin_product_path(@product)
	    		expect(page).to have_content '編集する'
	    	end
	    end

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

			it '商品名が表示される' do
	    		visit admin_product_path(@product)
	    		expect(page).to have_content @product.name
	    	end

	    	it '商品説明が表示される' do
	    		visit admin_product_path(@product)
	    		expect(page).to have_content @product.explanation
	    	end

	    	it 'ジャンルが表示される' do
	    		visit admin_product_path(@product)
	    		expect(page).to have_content @product.genre_id
	    	end

	    	it '税抜価格が表示される' do
	    		visit admin_product_path(@product)
	    		expect(page).to have_content @product.price
	    	end

	    	it '販売ステータスが表示される' do
	    		visit admin_product_path(@product)
	    		expect(page).to have_content '販売中'
	    	end

	    	it '「編集する」をクリックすることができる' do
	    		visit admin_product_path(@product)
	    		click_on '編集する'
	    	end
		end
	end

	describe '商品編集画面' do
		context '表示の確認' do
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

			it '商品編集画面が表示される' do
				visit edit_admin_product_path(@product)
	  			expect(current_path).to eq('/admin/products/' + @product.id.to_s + '/edit')
	    	end

	    	it '商品編集と表示される' do
	    		visit edit_admin_product_path(@product)
	    		expect(page).to have_content '商品編集'
	    	end

	    	it '商品名と表示される' do
	    		visit edit_admin_product_path(@product)
	    		expect(page).to have_content '商品名'
	    	end

	    	it '商品説明と表示される' do
	    		visit edit_admin_product_path(@product)
	    		expect(page).to have_content '商品説明'
	    	end

	    	it 'ジャンルと表示される' do
	    		visit edit_admin_product_path(@product)
	    		expect(page).to have_content 'ジャンル'
	    	end

	    	it '税抜価格と表示される' do
	    		visit edit_admin_product_path(@product)
	    		expect(page).to have_content '税抜価格'
	    	end

	    	it '円と表示される' do
	    		visit edit_admin_product_path(@product)
	    		expect(page).to have_content '円'
	    	end

	    	it '販売ステータスと表示される' do
	    		visit edit_admin_product_path(@product)
	    		expect(page).to have_content '販売ステータス'
	    	end

	    	it '販売中と表示される' do
	    		visit edit_admin_product_path(@product)
	    		expect(page).to have_content '販売中'
	    	end

	    	# it '変更を保存と表示される' do
	    	# 	visit edit_admin_product_path(@product)
	    	# 	expect(page).to have_content '変更を保存'
	    	# end
	    end

	    context 'フォームのテスト' do
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

			# it '画像の登録' do
	  #   		visit edit_admin_product_path(@product)
	  #   		fill_in 'product[image]', with: ''
	  #   	end

			it '商品名の編集' do
	    		visit edit_admin_product_path(@product)
	    		fill_in 'product[name]', with: Faker::Lorem.characters(number:5)
	    	end

	    	it '商品説明の編集' do
	    		visit edit_admin_product_path(@product)
	    		fill_in 'product[explanation]', with: Faker::Lorem.characters(number:10)
	    	end

	    	it '税抜価格の編集' do
	    		visit edit_admin_product_path(@product)
	    		fill_in 'product[price]', with: Faker::Number.number
	    	end

	    	it 'ジャンルの編集' do
	    		visit edit_admin_product_path(@product)
	    		select 'ケーキ'
	    	end

	    	it '販売ステータスの編集' do
	    		visit edit_admin_product_path(@product)
	    		select '販売中'
	    		select '売切れ'
	    	end

	    	it '「変更を保存」をクリックすることができる' do
	    		visit edit_admin_product_path(@product)
	    		click_on '変更を保存'
	    	end
		end
	end
end
