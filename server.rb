class Shop < BaseServer

  def call env
    params = get_request_parameters(env)
    path = get_request_path env

    [200, { 'Content-Type' => 'text/html' }, [Router.action(path: path, params: params, request: env)]]
  end

end