#I know, it's sucks, but I haven't time for searching beautiful solution
class Router

  @@routing = {}

  def self.get_settings path
    parsed_path = /\/(\w+)?\/?(\w+)?/.match(path)
    
    {
      'route' => "/#{parsed_path[1]}",
      'name' => "#{parsed_path[2]}"
    }
  end

  def self.get_name path
    path.sub(/\//, '') if path.length > 1 && path.is_a?(String)

  end

  def self.set_route params
    @@routing[params[:route]] = {
      :method => params[:method],
      :controller => params[:controller],
    }
  end

  def self.action params
    settings = get_settings params[:path]
    route = @@routing[settings['route']]

    route[:controller].send(route[:method], name: settings['name'], request: params[:request])
  end

end

