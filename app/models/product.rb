class Product < ApplicationRecord

	has_many :cart_items, dependent: :destroy
	has_many :customers, through: :cart_items
	has_many :order_products
	has_many :orders, through: :order_products
	belongs_to :genre
	attachment :image



	# admin
	# optional: true belongs_toの外部キーのnilを許可する
	belongs_to :genre, optional: true

	attachment :image

	validates :name, presence: true#, uniqueness: true
	validates :price, presence: true
	validates :explanation, presence: true
    

    def Product.search(search, product_or_customer, how_search)
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


end
