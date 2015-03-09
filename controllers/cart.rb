class CartController < MainController

  @@cart = []

  def add_to_cart
    Cart.add Product.find(params['name'])

    redirect_to @env['HTTP_REFERER'] || '/'
  end

  def index
    @products = Cart.all
    @total_price = Cart.show_price
  end

  def delete
    name = params['router_param']

    if name && name.size > 0
      Cart.delete name
    else
      Cart.delete_all
    end

    redirect_to @env['HTTP_REFERER'] || '/'
  end

  def create_order
    Cart.checkout
    Cart.delete_all

    redirect_to '/'
  end

end