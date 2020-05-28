require 'rails_helper'

RSpec.describe "Admin::Genres", type: :request do
	login_admin

	describe 'ジャンル登録・一覧画面' do
		context '表示の確認' do
			it '会員一覧画面が正しく表示される' do
				get new_admin_genre_path
				expect(response.status).to eq 200
			end

			it 'ジャンル一覧・追加と表示される' do
				visit new_admin_genre_path
	    		expect(page).to have_content 'ジャンル一覧・追加'
	    	end

	    	it 'ジャンルと表示される' do
	    		visit new_admin_genre_path
	    		expect(page).to have_content 'ジャンル'
	    	end

	    	it '有効と表示される' do
	    		visit new_admin_genre_path
	    		expect(page).to have_content '有効'
	    	end

	    	it '無効と表示される' do
	    		visit new_admin_genre_path
	    		expect(page).to have_content '無効'
	    	end

	    	it '追加と表示される' do
	    		visit new_admin_genre_path
	    		expect(page).to have_content '追加'
	    	end

	    	it '状態と表示される' do
	    		visit new_admin_genre_path
	    		expect(page).to have_content '状態'
	    	end
	    end

	    context 'フォームのテスト' do
	    	it 'フォームにジャンル名が表示される' do
	    		visit new_admin_genre_path
	    		fill_in 'genre[name]', with: Faker::Lorem.characters(number:5)
	    	end

	    	it 'ラジオボタンで「有効」が選択できる' do
	    		visit new_admin_genre_path
	    		choose '有効'
	    	end

	    	it 'ラジオボタンで「無効」が選択できる' do
	    		visit new_admin_genre_path
	    		choose '無効'
	    	end

	    	it '「追加」ボタンをクリックすることができる' do
	    		visit new_admin_genre_path
	    		click_on '追加'
	    	end
	    end

	    context 'ジャンル追加後の表示' do
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
	    		expect(page).to have_content @genre.name
	    	end

	    	it '追加されたジャンルのステータスが表示される' do
	    		visit new_admin_genre_path
	    		expect(page).to have_content '有効'
	    	end

	    	it '「編集する」ボタンをクリックすることができる' do
	    		visit new_admin_genre_path
	    		click_on '編集する'
	    	end
	    end
	end

	describe 'ジャンル編集画面' do
	    context '表示の確認' do
	    	before do
	    		visit new_admin_genre_path
	    		@genre = Genre.new(
	    			name: 'ケーキ',
	    			is_valid: true,
	    			)
				@genre.save
	    	end

	    	it 'ジャンル編集画面が表示される' do
	    		visit edit_admin_genre_path(@genre)
	  			expect(current_path).to eq('/admin/genres/' + @genre.id.to_s + '/edit')
	    	end

	    	it 'ジャンル編集と表示される' do
	    		visit edit_admin_genre_path(@genre)
	    		expect(page).to have_content '有効'
	    	end

	    	it 'ジャンルと表示される' do
	    		visit edit_admin_genre_path(@genre)
	    		expect(page).to have_content '無効'
	    	end

	    	it '有効と表示される' do
	    		visit edit_admin_genre_path(@genre)
	    		expect(page).to have_content '有効'
	    	end

	    	it '無効と表示される' do
	    		visit edit_admin_genre_path(@genre)
	    		expect(page).to have_content '無効'
	    	end
	    end

	    context 'フォームのテスト' do
	    	before do
	    		visit new_admin_genre_path
	    		@genre = Genre.new(
	    			name: 'ケーキ',
	    			is_valid: true,
	    			)
				@genre.save
	    	end

	    	it 'フォームにジャンル名が表示される' do
	    		visit edit_admin_genre_path(@genre)
	    		fill_in 'genre[name]', with: Faker::Lorem.characters(number:5)
	    	end

	    	it 'ラジオボタンで「有効」が選択できる' do
	    		visit edit_admin_genre_path(@genre)
	    		choose '有効'
	    	end

	    	it 'ラジオボタンで「無効」が選択できる' do
	    		visit edit_admin_genre_path(@genre)
	    		choose '無効'
	    	end

	    	it '「変更を保存する」をクリックすることができる' do
	    		visit edit_admin_genre_path(@genre)
	    		click_on '変更を保存する'
	    	end
	    end
	end
end

