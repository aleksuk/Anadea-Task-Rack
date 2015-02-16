class ProductModel

  @@products = []

  attr_accessor :name, :price

  def initialize name, price
    @name, @price = name, price
  end

  def save
    @@products << self
    self
  end

  def self.count
    @@products.size
  end

  def self.all
    @@products
  end

  def self.find name
    @@products.each do |el|
      return el if el.name == name
    end

    nil
  end

end
