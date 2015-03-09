class ProductsController < MainController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params['router_param'])
  end

end