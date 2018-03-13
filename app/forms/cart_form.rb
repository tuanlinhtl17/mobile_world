class CartForm
  def initialize params, cart = []
    @params = params
    @cart = cart
  end
  
  def data
    return @cart if @params[:mobile_id].nil?
    item = find_exits_item @params[:mobile_id]
    if item
      item["quantity"] += @params[:quantity].to_i
      item["color_id"] = @params[:color_id]
    else
      item = Item.new @params
      item.price = Mobile.find_by(id: @params[:mobile_id]).price
      @cart << item.as_json
    end
    
    @cart
  end
  
  def update_cart
    item = find_exits_item @params[:mobile_id]
    if item
      if @params[:quantity]
        item["quantity"] = @params[:quantity].to_i
      end
      if @params[:color_id]
       item["color_id"] = @params[:color_id]
      end
    end
    @cart
  end
  
  def delete_item
    item = find_exits_item @params[:mobile_id]
    if item
      @cart.delete item
    end
    @cart
  end
  
  private
  
  def find_exits_item mobile_id
    return @cart if @cart.nil?
    @cart.detect{|item| item["mobile_id"] == mobile_id}
  end
end

class Item
  attr_accessor :mobile_id, :quantity, :color_id, :price
  
  def initialize params
    @mobile_id = params[:mobile_id]
    @quantity = params[:quantity].to_i
    @color_id = params[:color_id]
  end
end
