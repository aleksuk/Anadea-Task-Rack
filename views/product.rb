class ProductView

  @template =<<STR
  <html>
    <head>
        <title></title>
    </head>
    <body>
       {{ content }}
    </body>
  </html>
STR

  def self.render_all_products products
    result = products.reduce '' do |sum, el|
      sum << "<div><a href=\"/#{el.name}\">#{el.name}</a><span>: #{el.price}</span></div>"
    end

    render result
  end

  def self.render_one product
    render "<div><span>#{product.name}: #{product.price} </span><a href=\"/\">Back</a></div>"
  end

  def self.render content
    @template.sub(/\{\{\ content }}/, content)
  end

end