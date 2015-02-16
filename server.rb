require_relative 'require'

class MyApp

  def call env
    params = get_request_parameters(env)
    path = get_request_path env

    [200, { 'Content-Type' => 'text/html' }, [Router.action(path: path, params: params)]]
  end

  def get_request_parameters env
    params_heshs = env['QUERY_STRING'].split('&')

    params = {}

    params_heshs.each do |el|
      param = el.split('=')
      params[param[0]] = param[1]
    end

    params
  end

  def get_request_path env
    path = env['PATH_INFO']
  end

end