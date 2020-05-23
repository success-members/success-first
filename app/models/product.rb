class Product < ApplicationRecord
	has_many :cart_items, dependent: :destroy
	has_many :customers, through: :cart_items
	has_many :order_products
	has_many :orders, through: :order_products
	belongs_to :genre
	attachment :image
end

def Product.search(search, product)
		if product == "1"
		  Product.where(['title LIKE ?', "%#{search}%"])
		else
		   Product.all
		end
end

def Product.search(search, user_or_book, how_search)
	    if how_search == "1"
	        Product.where(['name LIKE ?', "#{search}"])
	    elsif how_search == "2"
	        Product.where(['name LIKE ?', "#{search}%"])
	    elsif how_search == "3"
	        Product.where(['name LIKE ?', "%#{search}"])
	    elsif how_search == "4"
	        Product.where(['name LIKE ?', "%#{search}%"])
	    else
	        Product.all
	    end
    end
