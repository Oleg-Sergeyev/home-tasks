require_relative 'lib/gym'
require_relative 'lib/user'
require_relative 'lib/settings'
require_relative 'lib/functions'
require_relative 'lib/messages'
require 'date'
require 'io/console'

user = User.new(auth)
#p user.role
user.show_menu

#key = $stdin.getch
#user.input_key(key)
#p user.role
#puts 'едем дальше'

#veiwgym(GYM_1)



#setmenu(user.role)

#gym_1.load()
#arr_date.each do |day|
#  puts day
#end
#arr_time.each do |day|
#    puts day
#end
