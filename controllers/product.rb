class ProductController

  def self.show_all_products params = {}
    ProductView.render_all_products(ProductModel.all)
  end

  def self.show_product params = {}
    name = params['name'] || params[:name]
    product = ProductModel.find(name)

    ProductView.render_one product
  end

end