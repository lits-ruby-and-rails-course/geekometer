module UsersHelper
  def user_avatar_tag(user, version=nil)
    if user.avatar.url.nil?
      image_tag(user.avatar.default_url(version), alt: user.username)
    else
      image_tag(user.avatar.url(version), alt: user.username)
    end
  end
end