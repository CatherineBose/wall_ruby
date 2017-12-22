class Idea < ActiveRecord::Base
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  validates :content, presence: true
  validates :content, length: { minimum: 10 }
end
