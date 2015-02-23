class Content < BaseServer

  @content_types = {
    '.css' => 'text/css',
    '.ico' => 'image/png'
  }

  def self.get_content_type file_type
    @content_types[file_type] || ''
  end

  def initialize app
    @app = app
  end

  def call env
    path = get_request_path(env)
    file_type = /\.\w*$/.match(path)

    if file_type
      file_path = path.sub(/^\//, '')
      [200, { 'Content-Type' => Content.get_content_type(file_type.to_s) }, [read_file(file_path)]]
    else
      @app.call env
    end
  end

end