require_relative 'ClassLocalUser.rb'

user = LocalUser.new

if user.create_user == true
  print "Do you want manage any users ? 'y/n': "
  if gets.strip == "n"
    abort "Bye, bye!"
  end
end
#user.show_user
#user.write_file