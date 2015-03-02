Router.set_route method: 'GET', path: '/', controller: ProductController, action: :show_all_products
Router.set_route method: 'GET', path: '/product', controller: ProductController, action: :show_product
Router.set_route method: 'POST', path: '/cart', controller: CartController, action: :add_to_cart
Router.set_route method: 'GET', path: '/cart', controller: CartController, action: :show_cart
Router.set_route method: 'POST', path: '/clearCart', controller: CartController, action: :delete_products
Router.set_route method: 'POST', path: '/order', controller: CartController, action: :create_order

ProductModel.new('TV', 300).save
ProductModel.new('Laptop', 1200).save
ProductModel.new('Phone', 100).save
ProductModel.new('PC', 1800).save
