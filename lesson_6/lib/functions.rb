require_relative 'settings'
require 'digest'

#def auth(login, pass)
#  PLAYERS_DB.find { |row| row[1] == login && row[2] == Digest::MD5.hexdigest(pass).upcase }
#end
def auth
  loop do
    #puts `clear`
    print 'Input your login: '
    login = gets.strip
    pass = IO.console.getpass 'Input your password: '
    user = PLAYERS_DB.find { |row| row[1] == login && row[2] == Digest::MD5.hexdigest(pass).upcase }
    return Array[user[1], user[3], user[4]] if user
  end
end
