class Product < ApplicationRecord

	attachment :image

	validates :name, presence: true, uniqueness: true
	validates :price, presence: true
	validates :explanation, presence: true

end
