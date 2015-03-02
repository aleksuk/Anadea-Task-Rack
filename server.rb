class Shop < BaseServer

  def call env
    req = Rack::Request.new(env)
    result = Router.action(method: req.request_method, path: req.path, params: req.params, request: env)

    if result.is_a?(Hash) && result[:__redirect]
      [301, { 'Location' => result[:redirect_to] }, []]
    else
      [200, { 'Content-Type' => 'text/html' }, [result]]
    end

  end

end