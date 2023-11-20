class Category < ApplicationRecord
  # バリデーション
  validates :name, presence: true
  
  # アソシエーション
  has_many :rooms, through: :room_categories
  has_many :room_categories, dependent: :destroy
end
