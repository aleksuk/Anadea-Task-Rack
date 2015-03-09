class MainController

  def initialize env
    @env = env

    @request = Rack::Request.new env
    @response = Rack::Response.new

    @layout = 'views/application/application.html.erb'
    @request.params.merge!(env['url_params'])

    @headers = { 'Content-Type' => 'text/html' }
  end

  def call
    self.send(@env['action'])

    if !@is_redirected && !@template
      render "#{get_current_controller}/#{@env['action']}"
    end

    @headers.each { |k, v| @response[k] = v }
    @response.write @template
    @response.finish
  end

  def get_binding
    binding
  end

  private

  def params
    @request.params
  end

  def redirect_to url
    @is_redirected = true
    @response.status = 301
    @headers['Location'] = url
  end

  def render template
    @response.status = 200
    @template = Template.new(self).render template, @layout
  end

  def render_tpl template
    Template.new(self).render template
  end

  def current_user
    @env['session']['user']
  end

  def session
    @env['session']
  end

  def get_current_controller
    File.basename(self.class.to_s).sub(/Controller$/, '').downcase
  end

  def error
    render 'application/error'
  end
end