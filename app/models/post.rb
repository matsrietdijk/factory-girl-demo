class Post < ActiveRecord::Base
  belongs_to :author, class_name: User
  has_many :comments
  has_many :commenters, through: :comments
  has_many :likes
  has_many :likers, through: :likes

  validates :title, presence: true, length: { minimum: 10, maximum: 100 }
  validates :body, presence: true, legnth: { minimum: 250 }
  validates :author, presence: true
end
