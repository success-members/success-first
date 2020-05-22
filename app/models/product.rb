class Product < ApplicationRecord

	# optional: true belongs_toの外部キーのnilを許可する
	belongs_to :genre, optional: true

	attachment :image

	validates :name, presence: true#, uniqueness: true
	validates :price, presence: true
	validates :explanation, presence: true


end
