require_relative 'ClassLocalUsersDb.rb'

local_path = File.expand_path(File.dirname(__FILE__))
file_name = ""
puts "Welcome to 'USERS MANAGER' \nYou can create new csv-files, new users, save it and remove it.\n\n"
loop do
  puts "Input 'N' to create new csv-file\nInput 'D' to work default csv-file\nInput 'E' to work with created csv-file\nInput 'q' for exit" 
  print "Your choice: "
  manage_symbol = gets.strip
  loop do
    if manage_symbol == 'D'
      puts "New user will be saved in 'users.csv'\n"
      file_name = 'users.csv'
      break
    end
    if manage_symbol == 'N' || manage_symbol == 'E' 
      print "Input file name w/o extension: "
      file_name = gets.strip + '.csv'
      break
    end
    if manage_symbol == 'q'
      abort 'Bye, bye!'
    end
    #break if !(gets.strip == 'N' || gets.strip == 'Y' || gets.strip == 'q')
   end
   users_db = LocalUsersDb.new(local_path, file_name)
   loop do
     if users_db.create_user() == false
       puts "New user was not created"
     end  
     print "Do you want create new users ? 'y/n': "
     if gets.strip == "n"
       #abort "Bye, bye!"
       break
     end
   end
end