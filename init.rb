Router.set_route path: '/', controller: ProductController, method: :show_all_products
Router.set_route path: '/:name', controller: ProductController, method: :show_product

ProductModel.new('TV', '300$').save
ProductModel.new('Laptop', '1200$').save
ProductModel.new('Phone', '100$').save
ProductModel.new('PC', '1800$').save
