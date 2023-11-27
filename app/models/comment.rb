class Comment < ApplicationRecord
  # バリデーション
  validates :comment, presence: true, length: {maximum: 200 }
  
  # アソシエーション
  belongs_to :user
  belongs_to :room
end
