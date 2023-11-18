class Room < ApplicationRecord
  # バリデーション
  validates :title, presence: true
  validates :body, presence: true

  # アソシエーション
  belongs_to :user
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_one_attached :image

  def guest_user?
    email == GUEST_USER_EMAIL
  end

  def bookmarked_by?(user)
    bookmarks.where(user_id: user).exists? #①
  end

end
