class ProductView < MainView

  def self.render_all_products products
    result = products.reduce '' do |sum, el|
      sum << "<div><a href=\"/product/#{el.name}\">#{el.name}</a><span>: #{el.price}</span></div>"
    end

    render result
  end

  def self.render_one product
    render "<div><span>#{product.name}: #{product.price} </span><a href=\"/\">Back</a></div>"
  end

  def self.render content
    render_banner MainView.get_main_template.sub(/\{\{\ content }}/, content)
  end

end