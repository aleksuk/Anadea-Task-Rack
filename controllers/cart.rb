class CartController < MainController

  def add_to_cart
    cart.add Product.find(params['name'])

    redirect_to @env['HTTP_REFERER'] || '/'
  end

  def index
    @products = cart.all
    @total_price = cart.show_price
  end

  def delete
    name = params['router_param']

    if name && name.size > 0
      cart.delete name
    else
      cart.delete_all
    end

    redirect_to @env['HTTP_REFERER'] || '/'
  end

  def create_order
    cart.checkout
    cart.delete_all

    redirect_to '/'
  end

  def cart
    unless session['cart']
      session['cart'] = Cart.new
    end

    session['cart']
  end

end