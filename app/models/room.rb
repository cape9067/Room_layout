class Room < ApplicationRecord
  # バリデーション
  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 300 }
  validates :images, presence: true, length: { maximum: 3 }
  validates :category_ids, presence: true, length: { maximum: 3 }
  # アソシエーション
  belongs_to :user
  has_many :room_categories, dependent: :destroy
  has_many :categories, through: :room_categories
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many_attached :images


  def guest_user?
    email == GUEST_USER_EMAIL
  end

  def bookmarked_by?(user)
    bookmarks.where(user_id: user).exists? #①
  end


end
