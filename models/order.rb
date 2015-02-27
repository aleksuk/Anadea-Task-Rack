class OrderModel

  def add product
  end

  def delete product
  end

  def show_price
  end

  def delete_all
  end

  def self.all
  end

  def self.delete_all
  end

end

class CartModel
  def checkout
    order = Order.new
    #скопировать
    #очистить
    order.save
  end
end