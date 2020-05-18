class Genre < ApplicationRecord

  # ジャンル名を重複させない、空白禁止
  validates :name, presence: true, uniqueness: true
end
