class MainView

  def self.main_render content
    content = render_banner + content
    ERB.new(File.read('templates/application.html.erb')).result(get_binding { content })
  end

  def self.render_error
    main_render render_template 'error'
  end

  def self.render_banner
    @current_user = Session.current_user
    render_template 'header'
  end

  def self.render_template template
    ERB.new(File.read("templates/#{template}.html.erb")).result(get_binding)
  end

  def self.get_binding
    binding
  end

end