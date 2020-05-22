class CartItem < ApplicationRecord
	belongs_to :customer
	belongs_to :product
	validates :number, numericality: { only_integer: true, greater_than: 0 }
end
