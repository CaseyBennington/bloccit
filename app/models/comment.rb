class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  # belongs_to :topics, source: :commentable, source_type: :Topic, polymorphic: true
  # belongs_to :posts, source: :commentable, source_type: :Post, polymorphic: true

  belongs_to :user

  validates :body, length: { minimum: 5 }, presence: true
  validates :user, presence: true
end
