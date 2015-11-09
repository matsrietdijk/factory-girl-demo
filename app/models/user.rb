class User < ActiveRecord::Base
  has_many :posts, foreign_key: :author_id
  has_many :comments
  has_many :commented_posts, through: :comments
  has_many :likes
  has_many :liked_posts, through: :likes

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 8 }
end
