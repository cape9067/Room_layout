class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
         
  validates :name, presence: true, length: { minimum: 1, maximum: 20 }
  validates :email, presence: true, format: { with: /\A[a-zA-Z0-9]{1,}[@][a-zA-Z0-9]{1,}[.][a-zA-Z0-9]{1,}\z/ }, uniqueness: true
  
  has_many :rooms, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmarked_rooms, through: :bookmarks, source: :room
  has_one_attached :profile_image
  
  GUEST_USER_EMAIL = "guest@example.com"

  def self.guest
    find_or_create_by!(email: GUEST_USER_EMAIL) do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "guestuser"
    end
  end
  
  def guest_user?
    email == GUEST_USER_EMAIL
  end
  
  def log_in(user)
    session[:user_id] = user.id
   self.last_login_at = Time.current
   save
  end
  
  def last_login_time
    if last_login_at
    last_login_at.strftime('%Y-%m-%d %H:%M:%S')
    else
    '未ログイン'
    end
  end 
  
  def after_database_authentication
    self.update_column(:last_login_at, Time.current)
  end
 
  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_user_image.jpg'
  end
end
