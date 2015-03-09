class Cart

  @@cart = []

  def self.add product
    @@cart << product
  end

  def self.delete product
    el_index = @@cart.find_index do |el|
      el.name == product
    end
    
    @@cart.delete_at el_index
  end

  def self.show_price
    @@cart.reduce 0 do |sum, el|
      sum += el.price
    end
  end

  def self.all
    @@cart
  end

  def self.delete_all
    @@cart = []
  end

  def self.checkout
    order = Order.new

    @@cart.each do |el|
      order.add el
    end

    order.save
  end

end