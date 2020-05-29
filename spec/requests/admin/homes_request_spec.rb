require 'rails_helper'

RSpec.describe "Admin::Homes", type: :request do

	describe 'トップページ' do
		context '表示の確認' do

			it 'トップページが正しく表示される' do
				get admin_top_path
				expect(response.status).to eq 200
			end

			it '管理者画面と表示される' do
				visit admin_top_path
		    	expect(page).to have_content('管理者画面')
			end

			it '本日の注文件数と表示される' do
				visit admin_top_path
		    	expect(page).to have_content('本日の注文件数')
			end

			it '件と表示される' do
				visit admin_top_path
		    	expect(page).to have_content('件')
			end
		end
	end
end
