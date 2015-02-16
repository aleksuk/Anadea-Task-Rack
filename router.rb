#I know, it's sucks, but I haven't time for searching beautiful solution
class Router

  @@routing = {}

  def self.get_path path
    path.length > 1 ? '/:name' : '/'
  end

  def self.get_name path
    path.sub(/\//, '') if path.length > 1 && path.is_a?(String)

  end

  def self.set_route params
    @@routing[params[:path]] = {
      :method => params[:method],
      :controller => params[:controller],
    }
  end

  def self.action params
    
    return '' if params[:path].index('favicon.ico') || params[:path].nil?
    path = get_path params[:path]
    name = get_name params[:path]

    @@routing[path][:controller].send(@@routing[path][:method], name: name)
  end

end

