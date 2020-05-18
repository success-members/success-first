class Genre < ApplicationRecord

  # ジャンル名を重複させない
  validates :name, uniqueness: true
end
