class Genre < ApplicationRecord

	has_many :products

	# ジャンル名を重複させない、空白禁止
	validates :name, presence: true, uniqueness: true

end
