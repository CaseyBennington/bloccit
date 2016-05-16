class FavoriteMailer < ApplicationMailer
  default from: 'cbenning@vt.edu'

  def new_comment(user, post, comment)
    headers['Message-ID'] = "<comments/#{comment.id}@pacific-refuge-18365.herokuapp.com>"
    headers['In-Reply-To'] = "<post/#{post.id}@pacific-refuge-18365.herokuapp.com>"
    headers['References'] = "<post/#{post.id}@pacific-refuge-18365.herokuapp.com>"

    @user = user
    @post = post
    @comment = comment

    mail(to: user.email, subject: "New comment on #{post.title}")
  end
end
