class Cart

  def initialize
    @cart = []
  end

  def add product
    @cart << product
  end

  def delete product
    el_index = @cart.find_index do |el|
      el.name == product
    end
    
    @cart.delete_at el_index
  end

  def show_price
    @cart.reduce 0 do |sum, el|
      sum += el.price
    end
  end

  def all
    @cart
  end

  def delete_all
    @cart = []
  end

  def checkout
    order = Order.new

    @cart.each do |el|
      order.add el
    end

    order.save
  end

end