require 'rails_helper'

RSpec.describe "Admin::Orders", type: :request do

	describe 'admin/orders_controller' do
		context '注文履歴一覧画面' do
			login_admin

			it '注文履歴一覧画面が正しく表示される' do
				get admin_orders_path
				expect(response.status).to eq 200
			end

			it '注文履歴一覧と表示される' do
				visit admin_orders_path
	    		expect(page).to have_content('注文履歴一覧')
	    	end

	    	it '購入日時と表示される' do
	    		visit admin_orders_path
	    		expect(page).to have_content('購入日時')
	    	end

	    	it '購入者と表示される' do
	    		visit admin_orders_path
	    		expect(page).to have_content('購入者')
	    	end

	    	it '注文個数と表示される' do
	    		visit admin_orders_path
	    		expect(page).to have_content('注文個数')
	    	end

	    	it '注文ステータスと表示される' do
	    		visit admin_orders_path
	    		expect(page).to have_content('注文ステータス')
	    	end
		end

		# context '注文情報' do
		# 	login_admin
		# 	login_customer

		# 	before do
		# 		@order = Order.new(
		# 			payment_method: 0,
		# 			postage: 800,
		# 			billing: 1000,
		# 			postcode: 1234567,
		# 			address: '北海道札幌市',
		# 			name: '山田'
		# 			)
		# 		@order.customer_id = current_customer.id
		#  		@order.save
		# 	end

		# 	it '購入日時が表示される' do
		# 		visit admin_orders_path
		# 		expect(page).to have_content(@orders.customer.created_at)
		# 	end

		# 	it '購入者が表示される' do
		# 		visit admin_orders_path
		# 		expect(page).to have_content(@orders.customer.last_name)
		# 		expect(page).to have_content(@orders.customer.first_name)
		# 	end

		# 	it '注文個数が表示される' do
		# 		visit admin_orders_path
		# 		expect(page).to have_content(@orders.customer.number)
		# 	end

			# it '注文ステータスが表示される' do
			# 	visit admin_orders_path
			# 	expect(page).to have_content(orders.customer.making_status)
			# end
	# 	end
	end
end
