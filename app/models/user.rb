class User < ApplicationRecord

  before_save { self.email = email.downcase}

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable  and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable

  has_one :image
  has_many :recipes, dependent: :destroy

  mount_uploader :avatar, AvatarUploader

  validate :avatar_size

  # validates :username, presence: true,
  #           uniqueness: { case_sensitive: false },
  #           length: { minimum: 3, maximum: 25 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
            uniqueness: { case_sensitive: false },
            length: { maximum: 105 },
            format: { with: VALID_EMAIL_REGEX }


  private

  def avatar_size
    if avatar.size > 5.megabytes
      errors.add(avatar, "should be less than 5MG")
    end
  end
end