require 'rails_helper'

RSpec.describe "Admin::Products", type: :request do

	describe 'admin/products_controller' do
		context '商品一覧画面' do
			login_admin

			it '商品一覧画面が正しく表示される' do
				get admin_products_path
				expect(response.status).to eq 200
			end

			it '商品一覧と表示される' do
				visit admin_orders_path
	    		expect(page).to have_content('商品一覧')
	    	end

	    	# it '商品IDと表示される' do
	    	# 	visit admin_orders_path
	    	# 	expect(page).to have_content('商品ID')
	    	# end

	    	it '商品名と表示される' do
	    		visit admin_orders_path
	    		expect(page).to have_content('商品名')
	    	end

	    	# it '税抜価格' do
	    	# 	visit admin_orders_path
	    	# 	expect(page).to have_content('税抜価格')
	    	# end

	    	it 'ジャンルと表示される' do
	    		visit admin_orders_path
	    		expect(page).to have_content('ジャンル')
	    	end

	    	it 'ステータスと表示される' do
	    		visit admin_orders_path
	    		expect(page).to have_content('ステータス')
	    	end
		end

		context '商品新規登録画面と表示される' do
			login_admin

			it '商品新規登録画面が正しく表示される' do
				get new_admin_product_path
				expect(response.status).to eq 200
			end

			it '商品新規登録と表示される' do
	    		visit new_admin_product_path
	    		expect(page).to have_content('商品新規登録')
	    	end

	    	it '商品名と表示される' do
	    		visit new_admin_product_path
	    		expect(page).to have_content('商品名')
	    	end

	    	it '商品説明と表示される' do
	    		visit new_admin_product_path
	    		expect(page).to have_content('商品説明')
	    	end

	    	it 'ジャンルと表示される' do
	    		visit new_admin_product_path
	    		expect(page).to have_content('ジャンル')
	    	end

	    	# it '選択してくださいと表示される' do
	    	# 	visit new_admin_product_path
	    	# 	expect(page).to have_content('選択してください')
	    	# end

	    	it '税抜価格と表示される' do
	    		visit new_admin_product_path
	    		expect(page).to have_content('税抜価格')
	    	end

	    	it '円と表示される' do
	    		visit new_admin_product_path
	    		expect(page).to have_content('円')
	    	end

	    	it '販売ステータスと表示される' do
	    		visit new_admin_product_path
	    		expect(page).to have_content('販売ステータス')
	    	end

	    	it '販売中と表示される' do
	    		visit new_admin_product_path
	    		expect(page).to have_content('販売中')
	    	end

	    	it '新規登録と表示される' do
	    		visit new_admin_product_path
	    		expect(page).to have_content('新規登録')
	    	end

	    	# it '選択されていませんと表示される' do
	    	# 	visit new_admin_product_path
	    	# 	expect(page).to have_content('選択されていません')
	    	# end

	    	# it 'ファイルを選択と表示される' do
	    	# 	visit new_admin_product_path
	    	# 	expect(page).to have_content('ファイルを選択')
	    	# end
		end
	end
end
