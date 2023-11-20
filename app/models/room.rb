class Room < ApplicationRecord
  # バリデーション
  validates :title, presence: true
  validates :body, presence: true
  validates :images, presence: true, length: { maximum: 3 }
  validate :image_limit

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

  def image_limit
   if images.size > 3
     errors.add(:images, "can't be more than three.")
   end
  end


end
