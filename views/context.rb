class ERBContext

  def initialize hash ={}
    hash.each do |prop, value|
      self[prop] = value
    end
  end

  def get_binding
    binding
  end

  def []= prop, value
    instance_variable_set("@#{prop}", value)
  end

end