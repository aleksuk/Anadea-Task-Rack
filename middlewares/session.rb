class Session < BaseServer

  @@session = {}

  def initialize app
    @app = app
  end

  def call env
    request = Rack::Request.new(env)
    response = [301, { 'Location' => '/' }, ['']]
    token = request.cookies['token']
    
    env['session'] = @@session[token] || {}
    
    case request.path
    when '/logout'
      logout response, token
    when '/login'
      login response, generate_token, request.params['name']
    else
      @app.call env
    end

  end

  private

  def generate_token
    SecureRandom.hex
  end

  def set_cookie response, cookies
    response[1]['Set-Cookie'] = cookies
  end

  def redirect response, path
    response[1]['Location'] = path
  end

  def logout response, token
    set_cookie response, 'path=/;'

    @@session.delete(token)

    response
  end

  def login response, token, name
    set_cookie response, "token=#{token};path=/;"
    @@session[token] = { 
      'user' => { 'name' => name } 
    }

    response
  end

end