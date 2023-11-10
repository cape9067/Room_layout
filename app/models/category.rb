class Category < ApplicationRecord
  # バリデーション
  validates :name, presence: true
  
  # アソシエーション
  has_many :rooms, dependent: :destroy
end
