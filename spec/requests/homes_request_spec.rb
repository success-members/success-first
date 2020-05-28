require 'rails_helper'

RSpec.describe "Homes", type: :request do

	describe 'homes' do
		context 'トップページ' do

			it 'トップページが正しく表示される' do
				get root_path
				expect(response.status).to eq 200
			end

			it 'ジャンル検索と表示される' do
				visit root_path
		    	expect(page).to have_content('ジャンル検索')
			end

			it 'ようこそ、NaganoCakeへ！と表示される' do
				visit root_path
		    	expect(page).to have_content('ようこそ、NaganoCakeへ！')
			end

			it 'このサイトは、ケーキ販売のECサイトになります。と表示される' do
				visit root_path
		    	expect(page).to have_content('このサイトは、ケーキ販売のECサイトになります。')
			end

			it '会員でない方も商品の閲覧はできますが、と表示される' do
				visit root_path
		    	expect(page).to have_content('会員でない方も商品の閲覧はできますが、')
			end

			it '購入には会員登録が必要になります。と表示される' do
				visit root_path
		    	expect(page).to have_content('購入には会員登録が必要になります。')
			end

			it 'オススメ商品と表示される' do
				visit root_path
		    	expect(page).to have_content('オススメ商品')
			end

			it 'もっと見ると表示される' do
				visit root_path
		    	expect(page).to have_content('もっと見る')
			end
		end
	end
end
