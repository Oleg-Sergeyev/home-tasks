require_relative 'settings'
require 'digest'

def chk(user)
  PLAYERS_DB.find { |row| row[1] == user[0] && row[2] == Digest::MD5.hexdigest(user[1]).upcase }
end

def auth
  user = []
  loop do
    puts `clear`
    print 'Input your login: '
    login = gets.strip
    pass = IO.console.getpass 'Input your password: '
    user = chk(Array[login, pass])
    break unless user.nil?
  end
  Array[user[0], user[1], user[3], user[4]]
end
