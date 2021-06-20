require_relative 'settings'
require 'digest'
require 'io/console'
require 'io/wait'

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
  Array[user[0], user[1], user[3], user[4], user[5]]
end

# Menu level 1
#def setmenu_lv1(role)
#  puts 'Select one of the menu items'
#  if role == 'trainer'
#    MENU_TRAINER.each do |key, value|
#      puts key
#    end
#  else
#    MENU_PLAYER.each do |key, value|
#      puts key
#    end
#  end
#end

def clear
  puts `clear`
end

def veiwgym(gym)
  puts gym.name
  gym.arr_date.each do |day|
    puts "\n#{day}"
    gym.arr_time.each do |time|
      puts time
    end
  end
end
