class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  def active_for_authentication?
    super && (self.is_deleted == true)   #is_deleted==trueなら（退会したユーザー）を再度ログインできないようにする
 end




  has_many :cart_items, dependent: :destroy

  has_many :shipping_addresses, dependent: :destroy


  has_many :products, through: :cart_items
  has_many :shipping_address, dependent: :destroy


end
