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


def Customer.search(search, product_or_customer, how_search)
      if how_search == "1"
          #Customer.where(['first_name LIKE ?', "#{search}"])
          Customer.where(['first_name LIKE ? OR last_name LIKE ? OR last_name_kana LIKE ? OR first_name_kana LIKE ?', "#{search}", "#{search}", "#{search}", "#{search}"])
      elsif how_search == "2"
          #Customer.where(['first_name LIKE ?', "#{search}%"])
          Customer.where(['first_name LIKE ? OR last_name LIKE ? OR last_name_kana LIKE ? OR first_name_kana LIKE ?', "#{search}%", "#{search}%", "#{search}%", "#{search}%"])
      elsif how_search == "3"
          #Customer.where(['first_name LIKE ?', "%#{search}"])
          Customer.where(['first_name LIKE ? OR last_name LIKE ? OR last_name_kana LIKE ? OR first_name_kana LIKE ?', "%#{search}", "%#{search}", "%#{search}", "%#{search}"])
      elsif how_search == "4"
         # Customer.where(['first_name LIKE ?', "%#{search}%"])
          Customer.where(['first_name LIKE ? OR last_name LIKE ? OR last_name_kana LIKE ? OR first_name_kana LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%"])
      else
          Customer.all
      end
end

  include JpPrefecture
    jp_prefecture :prefecture_code
  
  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end
  
  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end

  has_many :orders


end
