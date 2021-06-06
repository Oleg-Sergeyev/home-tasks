class LocalNetworks
  def initialize(name, address)
  @name = name
  @ipv4_address = address
  end
  
  def get_network
    [@name, @ipv4_address]
  end
  
  def change_name
  end
end