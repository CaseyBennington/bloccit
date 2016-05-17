module UsersHelper
  def user_favorite_object(favorite)
    post = Post.find_by(id: favorite.post_id)
  end
end
