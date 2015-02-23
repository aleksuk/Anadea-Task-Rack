module ServerHelpers

  def get_request_parameters env
    params_hashs = env['QUERY_STRING'].split('&')

    params = {}

    params_hashs.each do |el|
      param = el.split('=')
      params[param[0]] = param[1]
    end

    params
  end

  def get_request_path env
    env['PATH_INFO']
  end

  def read_file path
    File.read(path)
  end
  
end