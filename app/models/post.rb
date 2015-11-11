class Post < ActiveRecord::Base
  belongs_to :author, class_name: User
  has_many :comments, dependent: :destroy
  has_many :commenters, through: :comments, source: :user
  has_many :likes, dependent: :destroy
  has_many :likers, through: :likes, source: :user

  validates :title, presence: true, length: { minimum: 10, maximum: 100 }
  validates :body, presence: true, length: { minimum: 250 }
  validates :author, presence: true
end
