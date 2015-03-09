class Template

  def initialize context
    @context = context
  end

  def render template, layout = nil
    view_content = erb("views/#{template}.html.erb").result(@context.get_binding)

    if layout
      erb(layout).result(@context.get_binding { view_content })
    else
      view_content
    end
  end

  def render_tpl template
    erb("views/#{template}.html.erb").result(@context.get_binding)
  end

  private

  def erb template
    ERB.new(File.read(template))
  end

end