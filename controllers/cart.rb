class CartController < MainController

  @@cart = []

  def self.add_to_cart params = {}
    name = params[:params]['name']
    CartModel.add ProductModel.find(name)

    redirect params[:request]['HTTP_REFERER'] || '/'
  end

  def self.show_cart params = {}
    CartView.render_cart CartModel.all, CartModel.show_price
  end

  def self.delete_products params = {}
    name = params[:params][:router_param]

    if name && name.size > 0
      CartModel.delete name
    else
      CartModel.delete_all
    end

    redirect params[:request]['HTTP_REFERER'] || '/'
  end

  def self.create_order params = {}
    CartModel.checkout
    CartModel.delete_all

    redirect '/'
  end

end