require 'csv'

class LocalHosts
  def initialize(name, mac_address, users_db, local_network)
  @name = name
  @mac = mac_address
  @users_db = users_db
  @local_network = local_network
  end
  private
  def change_local_network
  end
  private
  def change_name
  end
  public
  def load_file()
    CSV.open(File.expand_path(File.dirname(__FILE__)) + '/pc_list.csv', 'r') do |row|
    puts row
    end
  end
end
