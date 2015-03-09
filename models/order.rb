class Order

  attr_accessor :product, :date

  @@orders = []

  def initialize
    @time = Time.now
    @products = []
  end

  def add product
    @products << product
  end

  def save
    @@orders << self
  end

  def show_price
    @products.reduce 0 do |sum, el|
      sum += el.price
    end
  end

  def delete product
    #???
  end

  def self.delete_all
    @@orders.clear
  end

  def self.all
    @@orders
  end

end
