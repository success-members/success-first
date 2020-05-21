class Order < ApplicationRecord
	has_many :order_products
	has_many :products, through: :order_products
	belongs_to :customer
	validates :postcode, length: { is: 7 }
	validates :address, presence: true, length: { in: 1..100 }
	validates :name, presence: true

	enum payment_method: { クレジットカード: 0, 銀行振込: 1 }
	enum order_status: { 入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済み: 4 }
end
