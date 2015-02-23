class Exeption < BaseServer

  def initialize app
    @app = app
  end

  def call env
    begin
      @app.call env
    rescue
      [404, { 'Content-Type' => 'text/html' }, [MainView.render_error]]
    end
  end

end