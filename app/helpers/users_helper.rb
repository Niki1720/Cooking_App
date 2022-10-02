module UsersHelper
  def avatar_for(user)
    if @user.avatar?
      image_tag (user.avatar.url)
    else
      image_tag("image_user.png", :class => "image_tag")
    end
  end
end