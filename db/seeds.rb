include FactoryGirl::Syntax::Methods

[User, Post, Comment, Like].map(&:delete_all)

users = create_list(:user, 5)

posts = []
users.each do |user|
  posts |= create_list(:post, 5, author: user)
end

posts.each do |post|
  rand(10).times { create(:comment, post: post, user: users.sample) }
  rand(5).times { create(:like, post: post, user: users.sample) }
end
