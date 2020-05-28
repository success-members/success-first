require 'rails_helper'

RSpec.describe "Admin::Genres", type: :request do

	describe 'admin/genres_controller' do
		context 'ジャンル登録・一覧画面' do
			login_admin

			it '会員一覧画面が正しく表示される' do
				get new_admin_genre_path
				expect(response.status).to eq 200
			end

			it 'ジャンル一覧・追加と表示される' do
				visit new_admin_genre_path
	    		expect(page).to have_content('ジャンル一覧・追加')
	    	end

	    	it 'ジャンルと表示される' do
	    		visit new_admin_genre_path
	    		expect(page).to have_content('ジャンル')
	    	end

	    	it '有効と表示される' do
	    		visit new_admin_genre_path
	    		expect(page).to have_content('有効')
	    	end

	    	it '無効と表示される' do
	    		visit new_admin_genre_path
	    		expect(page).to have_content('無効')
	    	end

	    	it '追加と表示される' do
	    		visit new_admin_genre_path
	    		expect(page).to have_content('追加')
	    	end

	    	it '状態と表示される' do
	    		visit new_admin_genre_path
	    		expect(page).to have_content('状態')
	    	end
	    end

	    context 'ジャンル・一覧の表示' do
	    	login_admin
	    	before do
	    		visit new_admin_genre_path
	    		@genre = Genre.new(
	    			name: 'ケーキ',
	    			is_valid: true
	    			)
				@genre.save
	    	end

	    	it '追加されたジャンル名が表示される' do
	    		visit new_admin_genre_path
	    		expect(page).to have_content(@genre.name)
	    	end

	    	# it '追加されたジャンルのステータスが表示される' do
	    	# 	visit new_admin_genre_path
	    	# 	expect(page).to have_content(@genre.is_valid)
	    	# end
	    end
	end
end

