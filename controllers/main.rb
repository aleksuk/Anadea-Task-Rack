class MainController

  def self.redirect path
    {
      :__redirect => true,
      :redirect_to => path
    }
  end

end