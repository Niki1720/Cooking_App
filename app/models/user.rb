class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable  and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable
  before_save { self.email = email.downcase}

  has_one :image
  has_many :recipes, dependent: :destroy


  # validates :username, presence: true,
  #           uniqueness: { case_sensitive: false },
  #           length: { minimum: 3, maximum: 25 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
            uniqueness: { case_sensitive: false },
            length: { maximum: 105 },
            format: { with: VALID_EMAIL_REGEX }
end