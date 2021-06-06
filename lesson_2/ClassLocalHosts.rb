require 'csv'

class LocalHosts
  def initialize(name, mac_address, brand)
    @name = name
    @mac = mac_address
    @brand = brand
  end

  def get_host
    [@name, @mac, @brand, @local_network]
    # @brand
    # @users_db
    # @local_network
  end

  def set_host(local_network)
    # @users_db = users_db
    @local_network = local_network
  end
end
