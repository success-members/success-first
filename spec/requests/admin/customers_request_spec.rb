require 'rails_helper'

RSpec.describe "Admin::Customers", type: :request do

	let(:customer) { create(:customer) }

	describe '会員一覧画面' do
		context '項目の表示' do
			login_admin

			it '会員一覧画面が正しく表示される' do
				get admin_customers_path
				expect(response.status).to eq 200
			end

			it '会員一覧と表示される' do
				visit admin_customers_path
	    		expect(page).to have_content '会員一覧'
	    	end

	    	it '会員IDと表示される' do
	    		visit admin_customers_path
	    		expect(page).to have_content '会員ID'
	    	end

	    	it '氏名と表示される' do
	    		visit admin_customers_path
	    		expect(page).to have_content '氏名'
	    	end

	    	it 'メールアドレスと表示される' do
	    		visit admin_customers_path
	    		expect(page).to have_content 'メールアドレス'
	    	end

	    	it 'ステータスと表示される' do
	    		visit admin_customers_path
	    		expect(page).to have_content 'ステータス'
	    	end
	    end

	    context '会員情報' do
	    	login_admin
			login_customer

	    	it '会員IDが表示される' do
				visit admin_customers_path
				expect(page).to have_content customer.id
			end

			it '氏名が表示される' do
				visit admin_customers_path
				expect(page).to have_content customer.last_name
				expect(page).to have_content customer.first_name
			end

			it 'メールアドレスが表示される' do
				visit admin_customers_path
				expect(page).to have_content customer.email
			end

			it 'ステータスが表示される' do
				visit admin_customers_path
				expect(page).to have_content '有効'
			end

			it '氏名をクリックすることができる' do
	    		visit admin_customers_path
	    		click_on (customer.last_name + customer.first_name)
	    	end
		end
	end


	describe '会員詳細画面' do
		context '項目の表示' do
	    	login_admin
	    	login_customer

	    	it '会員詳細画面が表示される' do
	    		visit admin_customer_path(customer)
	  			expect(current_path).to eq('/admin/customers/' + customer.id.to_s)
	    	end

	    	it '顧客IDと表示される' do
				visit admin_customer_path(customer)
				expect(page).to have_content '顧客ID'
			end

			it '氏名と表示される' do
				visit admin_customer_path(customer)
				expect(page).to have_content '氏名'
			end

			it 'フリガナと表示される' do
				visit admin_customer_path(customer)
				expect(page).to have_content 'フリガナ'
			end

			it '郵便番号と表示される' do
				visit admin_customer_path(customer)
				expect(page).to have_content '郵便番号'
			end

			it '住所と表示される' do
				visit admin_customer_path(customer)
				expect(page).to have_content '住所'
			end

			it '電話番号と表示される' do
				visit admin_customer_path(customer)
				expect(page).to have_content '電話番号'
			end

			it 'メールアドレスと表示される' do
				visit admin_customer_path(customer)
				expect(page).to have_content 'メールアドレス'
			end
	    end

	    context '会員情報' do
	    	login_admin
	    	login_customer

	    	it '会員詳細と表示される' do
	    		visit admin_customer_path(customer)
	    		expect(page).to have_content '会員詳細'
	    	end

	    	it '会員IDが表示される' do
	    		visit admin_customer_path(customer)
	    		expect(page).to have_content customer.id
	    	end

	    	it '会員ステータスが有効と表示される' do
	    		visit admin_customer_path(customer)
	    		expect(page).to have_content '有効'
	    	end

	    	it '氏名が表示される' do
	    		visit admin_customer_path(customer)
	    		expect(page).to have_content customer.last_name
	    		expect(page).to have_content customer.first_name
	    	end

	    	it '氏名（フリガナ）が表示される' do
	    		visit admin_customer_path(customer)
	    		expect(page).to have_content customer.last_name_kana
	    		expect(page).to have_content customer.first_name_kana
	    	end

	    	it '郵便番号が表示される' do
	    		visit admin_customer_path(customer)
	    		expect(page).to have_content customer.postcode
	    	end

	    	it '住所が表示される' do
	    		visit admin_customer_path(customer)
	    		expect(page).to have_content customer.address
	    	end

	    	it '電話番号が表示される' do
	    		visit admin_customer_path(customer)
	    		expect(page).to have_content customer.phone_number
	    	end

	    	it 'メールアドレスが表示される' do
	    		visit admin_customer_path(customer)
	    		expect(page).to have_content customer.email
	    	end

	    	it '「編集する」をクリックすることができる' do
	    		visit admin_customer_path(customer)
	    		click_on '編集する'
	    	end

	    	it '「注文履歴一覧を見る」をクリックすることができる' do
	    		visit admin_customer_path(customer)
	    		click_on '注文履歴一覧を見る'
	    	end
	    end
	end

	describe '会員編集画面' do
		context '項目の表示' do
	    	login_admin
	    	login_customer

	    	it '会員詳細画面が表示される' do
	    		visit edit_admin_customer_path(customer)
	  			expect(current_path).to eq('/admin/customers/' + customer.id.to_s + '/edit')
	    	end

	    	it '会員情報編集と表示される' do
	    		visit edit_admin_customer_path(customer)
	    		expect(page).to have_content '会員情報編集'
	    	end

	    	it '会員IDと表示される' do
	    		visit edit_admin_customer_path(customer)
	    		expect(page).to have_content '会員ID'
	    	end

	    	it '会員IDが表示される' do
	    		visit edit_admin_customer_path(customer)
	    		expect(page).to have_content customer.id
	    	end

	    	it '氏名と表示される' do
				visit edit_admin_customer_path(customer)
				expect(page).to have_content '氏名'
			end

			it 'フリガナと表示される' do
				visit edit_admin_customer_path(customer)
				expect(page).to have_content 'フリガナ'
			end

			it '郵便番号と表示される' do
				visit edit_admin_customer_path(customer)
				expect(page).to have_content '郵便番号'
			end

			it '住所と表示される' do
				visit edit_admin_customer_path(customer)
				expect(page).to have_content '住所'
			end

			it '電話番号と表示される' do
				visit edit_admin_customer_path(customer)
				expect(page).to have_content '電話番号'
			end

			it 'メールアドレスと表示される' do
				visit edit_admin_customer_path(customer)
				expect(page).to have_content 'メールアドレス'
			end

			it '会員ステータスと表示される' do
				visit edit_admin_customer_path(customer)
				expect(page).to have_content '会員ステータス'
			end
	    end

	    context 'フォームのテスト' do
	    	login_admin
	    	login_customer

	    	it '氏名が表示される' do
				visit edit_admin_customer_path(customer)
	    		fill_in 'customer[last_name]', with: Faker::Lorem.characters(number:5)
	    		fill_in 'customer[first_name]', with: Faker::Lorem.characters(number:5)
	    	end

	    	it 'フリガナが表示される' do
	    		visit edit_admin_customer_path(customer)
	    		fill_in 'customer[last_name_kana]', with: Faker::Lorem.characters(number:5)
	    		fill_in 'customer[first_name_kana]', with: Faker::Lorem.characters(number:5)
	    	end

	    	it '郵便番号が表示される' do
	    		visit edit_admin_customer_path(customer)
	    		fill_in 'customer[postcode]', with: Faker::Lorem.characters(number:5)
	    	end

	    	it '住所が表示される' do
	    		visit edit_admin_customer_path(customer)
	    		fill_in 'customer[address]', with: Faker::Lorem.characters(number:5)
	    	end

	    	it '電話番号が表示される' do
	    		visit edit_admin_customer_path(customer)
	    		fill_in 'customer[phone_number]', with: Faker::Lorem.characters(number:5)
	    	end

	    	it 'メールアドレスが表示される' do
	    		visit edit_admin_customer_path(customer)
	    		fill_in 'customer[email]', with: Faker::Lorem.characters(number:5)
	    	end

	    	it 'ラジオボタンで「有効」が選択できる' do
	    		visit edit_admin_customer_path(customer)
	    		choose '有効'
	    	end

	    	it 'ラジオボタンで「退会済み」が選択できる' do
	    		visit edit_admin_customer_path(customer)
	    		choose '退会済み'
	    	end

	    	it '「変更を保存する」をクリックすることができる' do
	    		visit edit_admin_customer_path(customer)
	    		click_on '変更を保存する'
	    	end
	    end
	end
end
