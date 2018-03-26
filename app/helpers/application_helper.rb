module ApplicationHelper
  def makers
    @makers = Maker.all
  end
  
  def avatar_for user, options = {size: 80}
    if user.image?
      image_tag user.image.url
    else
      gravatar_id = Digest::MD5::hexdigest user.email.downcase
      size = options[:size]
      gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
      image_tag gravatar_url, alt: user.email, class: "gravatar"
    end
  end
  
  def find_color_order_detail color_id
    Color.find_by(id: color_id).color
  end
end
