class Router

  @@routing = []

  def self.get_settings path
    parsed_path = /\/(\w+)?\/?(\w+)?/.match(path)

    {
      'router_path' => "/#{parsed_path[1]}",
      'router_param' => "#{parsed_path[2]}"
    }
  end

  def self.get_name path
    path.sub(/\//, '') if path.length > 1 && path.is_a?(String)

  end

  def self.set_route params
    @@routing << params
  end

  def self.action params
    settings = get_settings params[:path]
    route = find_route params, settings

    params[:env]['url_params'] = settings
    params[:env]['action'] = route[:action]

    route[:controller].new(params[:env]).call
  end

  def self.find_route params, settings
    @@routing.detect do |el|
      el[:method] == params[:method] && el[:path] == settings['router_path']
    end
  end

end

