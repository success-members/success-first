require 'rails_helper'

RSpec.describe "Admin::Orders", type: :request do

	let(:customer) { create(:customer) }

	describe '注文履歴一覧画面' do
		context '項目の表示' do
			login_admin

			it '注文履歴一覧画面が正しく表示される' do
				get admin_orders_path
				expect(response.status).to eq 200
			end

			it '注文履歴一覧と表示される' do
				visit admin_orders_path
	    		expect(page).to have_content '注文履歴一覧'
	    	end

	    	it '購入日時と表示される' do
	    		visit admin_orders_path
	    		expect(page).to have_content '購入日時'
	    	end

	    	it '購入者と表示される' do
	    		visit admin_orders_path
	    		expect(page).to have_content '購入者'
	    	end

	    	it '注文個数と表示される' do
	    		visit admin_orders_path
	    		expect(page).to have_content '注文個数'
	    	end

	    	it '注文ステータスと表示される' do
	    		visit admin_orders_path
	    		expect(page).to have_content '注文ステータス'
	    	end
		end

		context '注文情報' do
			login_admin
			login_customer

			before do
				visit new_order_path
				@order = Order.new(
					payment_method: 0,
					postage: 800,
					billing: 1000,
					postcode: 1234567,
					address: '北海道札幌市',
					name: '山田 花子',
					)
				@order.customer_id = 1
		 		@order.save
			end

			it '購入日時が表示される' do
				visit admin_orders_path
				expect(page).to have_content @order.created_at.strftime("%Y-%m-%d %H:%M:%S")
			end

			it '購入者が表示される' do
				visit admin_orders_path
				expect(page).to have_content @order.customer.last_name
				expect(page).to have_content @order.customer.first_name
			end

			it '注文個数が表示される' do
				visit admin_orders_path
				expect(page).to have_content @order.order_products.count
			end

			it '注文ステータスが表示される' do
				visit admin_orders_path
				expect(page).to have_content @order.order_status
			end
		end
	end

	describe '注文履歴一覧画面' do
		context '項目の表示' do
			login_admin
			login_customer

			before do
				visit new_order_path
				@order = Order.new(
					payment_method: 0,
					postage: 800,
					billing: 1000,
					postcode: 1234567,
					address: '北海道札幌市',
					name: '山田 花子',
					)
				@order.customer_id = 1
		 		@order.save
			end

			it '注文履歴詳細画面が表示される' do
	    		visit admin_order_path(@order)
	  			expect(current_path).to eq('/admin/orders/' + @order.id.to_s)
	    	end

	    	it '購入者と表示される' do
	    		visit admin_order_path(@order)
	    		expect(page).to have_content '購入者'
	    	end

	    	it '配送先と表示される' do
	    		visit admin_order_path(@order)
	    		expect(page).to have_content '配送先'
	    	end

	    	it '支払方法と表示される' do
	    		visit admin_order_path(@order)
	    		expect(page).to have_content '支払方法'
	    	end

	    	it '注文ステータスと表示される' do
	    		visit admin_order_path(@order)
	    		expect(page).to have_content '注文ステータス'
	    	end

	    	it '商品名と表示される' do
	    		visit admin_order_path(@order)
	    		expect(page).to have_content '商品名'
	    	end

	    	it '単価と表示される' do
	    		visit admin_order_path(@order)
	    		expect(page).to have_content '単価'
	    	end

	    	it '数量と表示される' do
	    		visit admin_order_path(@order)
	    		expect(page).to have_content '数量'
	    	end

	    	it '小計と表示される' do
	    		visit admin_order_path(@order)
	    		expect(page).to have_content '小計'
	    	end

	    	it '制作ステータスと表示される' do
	    		visit admin_order_path(@order)
	    		expect(page).to have_content '制作ステータス'
	    	end

	    	it '商品合計と表示される' do
	    		visit admin_order_path(@order)
	    		expect(page).to have_content '商品合計'
	    	end

	    	it '送料と表示される' do
	    		visit admin_order_path(@order)
	    		expect(page).to have_content '送料'
	    	end

	    	it '請求金額合計と表示される' do
	    		visit admin_order_path(@order)
	    		expect(page).to have_content '請求金額合計'
	    	end
		end

		context '注文情報' do
			login_admin
			login_customer

			before do
				visit new_order_path
				@order = Order.new(
					payment_method: 0,
					postage: 800,
					billing: 1000,
					postcode: 7654321,
					address: '北海道札幌市',
					name: '山田 花子',
					)
				@order.customer_id = 1
		 		@order.save

		 		@total_amount = @order.billing - @order.postage
			end

			it '購入者が表示される' do
				visit admin_order_path(@order)
				expect(page).to have_content @order.customer.last_name
				expect(page).to have_content @order.customer.first_name
			end

			it '配送先が表示される' do
				visit admin_order_path(@order)
				expect(page).to have_content @order.postcode
				expect(page).to have_content @order.address
			end

			it '購入者が表示される' do
				visit admin_order_path(@order)
				expect(page).to have_content @order.customer.last_name
				expect(page).to have_content @order.customer.first_name
			end

			it '支払方法が表示される' do
				visit admin_order_path(@order)
				expect(page).to have_content @order.payment_method
			end

			# it '商品名が表示される' do
			# 	visit admin_order_path(@order)
			# 	expect(page).to have_content @order_product.product.name
			# end

			# it '単価	が表示される' do
			# 	visit admin_order_path(@order)
			# 	expect(page).to have_content ((@order_product.product.price * 1.1).round(2)).ceil
			# end

			# it '数量が表示される' do
			# 	visit admin_order_path(@order)
			# 	expect(page).to have_content @order_product.number
			# end

			# it '小計が表示される' do
			# 	visit admin_order_path(@order)
			# 	expect(page).to have_content (((@order_product.product.price * 1.1).round(2)).ceil) * order_product.number
			# end

			it '商品合計が表示される' do
				visit admin_order_path(@order)
				expect(page).to have_content @total_amount
			end

			it '送料が表示される' do
				visit admin_order_path(@order)
				expect(page).to have_content @order.postage
			end

			it '請求金額合計が表示される' do
				visit admin_order_path(@order)
				expect(page).to have_content @order.billing
			end
		end
	end
end
