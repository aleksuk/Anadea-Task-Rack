class CartView < MainView

  def self.render_cart products, total_price
    @products, @total_price = products, total_price
    
    main_render render_template 'cart'
  end

end