Router.set_route method: 'GET', path: '/', controller: ProductsController, action: :index
Router.set_route method: 'GET', path: '/product', controller: ProductsController, action: :show
Router.set_route method: 'POST', path: '/cart', controller: CartController, action: :add_to_cart
Router.set_route method: 'GET', path: '/cart', controller: CartController, action: :index
Router.set_route method: 'POST', path: '/clearCart', controller: CartController, action: :delete
Router.set_route method: 'POST', path: '/order', controller: CartController, action: :create_order

Product.new('TV', 300).save
Product.new('Laptop', 1200).save
Product.new('Phone', 100).save
Product.new('PC', 1800).save
