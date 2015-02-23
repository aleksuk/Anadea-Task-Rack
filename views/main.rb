class MainView

  @template =<<STR
  <!DOCTYPE html>
  <html>
    <head>
        <title>Shop</title>
        <link rel="stylesheet" href="/public/css.css" />
    </head>
    <body>
        {{ content }}
    </body>
  </html>
STR
  
  @form =<<STR
  <div> Input your name 
    <form action="/login">
      <input name="name" action="/authentication" />
      <button type="submit"> Login </button>
    </form>
  </div>
STR

  def self.render_error
    render_banner(@template).sub(/\{\{\ content }}/, 'Error! <a href="/">Back</a>')
  end

  def self.render_banner content
    banner = if Session.current_user
      "<div> Hello #{Session.current_user['name']}!!! <a href=\"/logout\">LogOut</a></div>"
    else
      MainView.get_form_template
    end

    content.sub(/<body>/, "<body>#{banner}")
  end

  def self.get_main_template
    @template
  end

  def self.get_form_template
    @form
  end

end