class Product < ApplicationRecord
	has_many :cart_items, dependent: :destroy
	has_many :customers, through: :cart_items
	has_many :order_products
	has_many :orders, through: :order_products
	belongs_to :genre
	attachment :image
end
