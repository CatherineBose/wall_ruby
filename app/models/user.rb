class User < ActiveRecord::Base
  has_secure_password

  has_many :ideas, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :userIdea_liked, through: :ideas, source: :likes
  
  validates :name, :alias, presence: true, length: { minimum: 2 }
  # validates :name, :alias, presence: true
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  
  before_save :email_lowercase

  def email_lowercase
  email.downcase!
  end
end
