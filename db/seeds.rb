require 'random_data'

# Create Users
5.times do
  User.create!(
    name: RandomData.random_name,
    email: RandomData.random_email,
    password: RandomData.random_sentence
  )
end
users = User.all

# Create Topics
15.times do
  Topic.create!(
    name: RandomData.random_sentence,
    description: RandomData.random_paragraph
  )
end
topics = Topic.all

# Create Posts
50.times do
  Post.create!(
    user: users.sample,
    topic: topics.sample,
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph
  )
end
posts = Post.all

# Create Comments
# # posts
100.times do
  Comment.create!(
    user: users.sample,
    commentable_id: posts.sample.id,
    commentable_type: 'Post',
    # post: posts.sample,
    body: RandomData.random_paragraph
  )
end

# topics
100.times do
  Comment.create!(
    user: users.sample,
    commentable_id: topics.sample.id,
    commentable_type: 'Topic',
    # topic: topics.sample,
    body: RandomData.random_paragraph
  )
end
# comments = Comment.all
# comments.each do |comment|
#   topics.sample.comment = comment
# end

# Create an admin user
admin = User.create!(
  name: 'Admin User',
  email: 'admin@example.com',
  password: 'helloworld',
  role: 'admin'
)

# Create a member
member = User.create!(
  name: 'Member User',
  email: 'member@example.com',
  password: 'helloworld'
)

puts 'Seed finished'
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
