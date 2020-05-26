require 'rails_helper'

RSpec.describe "Admin::Genres", type: :request do

	describe 'ジャンル登録・一覧画面' do
		context 'ジャンル登録・一覧画面が正しく表示される' do
			login_admin
			it 'リクエストは200 OKとなること' do
				get new_admin_genre_path
				expect(response.status).to eq 200
			end
		end
	end

	# describe 'ジャンル編集画面' do
	# 	context 'ジャンル編集画面が正しく表示される' do
	# 		login_admin
	# 		it 'リクエストは200 OKとなること' do
	# 			get :edit, id: @genre.id
	# 			expect(response.status).to eq 200
	# 		end
	# 	end
	# end

end
