class UserDecorator < Draper::Decorator
	decorates_finders
  delegate_all
  
  def avatar_tiny
    if source.avatar.exists?
      source.avatar.url(:tiny)
    else
      "http://placehold.it/32x32"
    end
  end
  
  def avatar_small
    if source.avatar.exists?
      source.avatar.url(:small)
    else
      "http://placehold.it/100x100"
    end
  end
  
  def avatar_medium
    if source.avatar.exists?
      source.avatar.url(:mediu,)
    else
      "http://placehold.it/200x200"
    end
  end
  
  def created_at
    source.created_at.strftime("%d %b %Y, %H:%M")
  end
end