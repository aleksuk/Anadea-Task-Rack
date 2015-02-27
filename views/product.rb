class ProductView < MainView

  def self.render_all_products products
    @products = products

    main_render render_template 'products'
  end

  def self.render_one product
    @product = product
    main_render render_template 'product'
  end

end