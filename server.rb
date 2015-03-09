class Shop < BaseServer

  def call env
    req = Rack::Request.new(env)
    Router.action(method: req.request_method, path: req.path, params: req.params, env: env)
  end

end