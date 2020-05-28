require 'rails_helper'

RSpec.describe "Admin::Customers", type: :request do

	describe 'admin/customers_controller' do
		context '会員一覧画面' do
			login_admin

			it '会員一覧画面が正しく表示される' do
				get admin_customers_path
				expect(response.status).to eq 200
			end

			it '会員一覧と表示される' do
				visit admin_customers_path
	    		expect(page).to have_content('会員一覧')
	    	end

	    	it '会員IDと表示される' do
	    		visit admin_customers_path
	    		expect(page).to have_content('会員ID')
	    	end

	    	it '氏名と表示される' do
	    		visit admin_customers_path
	    		expect(page).to have_content('氏名')
	    	end

	    	it 'メールアドレスと表示される' do
	    		visit admin_customers_path
	    		expect(page).to have_content('メールアドレス')
	    	end

	    	it 'ステータスと表示される' do
	    		visit admin_customers_path
	    		expect(page).to have_content('ステータス')
	    	end
	    end

	    context '会員情報' do
	    	login_admin
			login_customer

	    	it '会員IDが表示される' do
				visit admin_customers_path
				expect(page).to have_content(customer.id)
			end

			it '氏名が表示される' do
				visit admin_customers_path
				expect(page).to have_content(customer.last_name)
				expect(page).to have_content(customer.first_name)
			end

			it 'メールアドレスが表示される' do
				visit admin_customers_path
				expect(page).to have_content(customer.email)
			end

			# it 'ステータスが表示される' do
			# 	visit admin_customers_path
			# 	expect(page).to have_content(customer.is_deleted)
			# end
		end
	end
end
