class Exeption < BaseServer

  def initialize app
    @app = app
  end

  def call env
    begin
      @app.call env
    rescue
      [500, { 'Content-Type' => 'text/html' }, [MainController.new(env).send(:error)]]
    end
  end

end