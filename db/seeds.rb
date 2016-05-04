require 'random_data'

# Create Posts
50.times do
  Post.create!(
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph
  )
end
posts = Post.all

# Create Comments

100.times do
  Comment.create!(
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end

unique_post = Post.find_or_create_by(title: 'Unique Post Title', body: 'Unique Post Body')
Comment.find_or_create_by(post: Post.find(unique_post), body: 'Unique Comment Body')

puts 'Seed finished'
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
