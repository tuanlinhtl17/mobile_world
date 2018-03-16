module CartHelper
  def find_exits_item cart, mobile_id
    cart.detect{|item| item["mobile_id"] == mobile_id}
  end
  
  def find_color_mobile cart, mobile_id
    Color.find_by(id: find_exits_item(cart, mobile_id)["color_id"]).color
  end
end
