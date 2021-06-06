require_relative 'ClassLocalUsersDb.rb'
require_relative 'ClassLocalHosts.rb'
require_relative 'ClassLocalNetworks.rb'

# 'Загрузка' компьютеров в массив
hosts = CSV.read(File.expand_path(File.dirname(__FILE__)) + '/pc_list.csv')
hosts.shift
@array_pc = [];
hosts.each do |element|
  new_pc = LocalHosts.new(element[0], element [1], element[2])# Создание объекта 'компьютер'
  _array = [element[0], new_pc]
  @array_pc.push(_array)
end
# 'Загрузка' сетей в массив
networks = CSV.read(File.expand_path(File.dirname(__FILE__)) + '/networks_list.csv')
networks.shift
@array_networks = [];
networks.each do |element|
  new_network = LocalNetworks.new(element[0], element [1])# Создание объекта 'сеть'
  _array = [element[0], new_network]
  @array_networks.push(_array)
end

local_path = File.expand_path(File.dirname(__FILE__))
file_name = ""
#puts `clear`
puts "Welcome to 'USERS MANAGER' \nYou can create new users database, create new users, save it."
#puts "Also you can upload users db to computers."
puts "\nComputers list"
# Вывод компьютеров
@array_pc.each do |element|
  puts "PC: " + (element[1].get_host())[0] + " mac: " + (element[1].get_host())[1] + " brand: " + (element[1].get_host())[2]
end
# Вывод сетей
puts "\nNetworks list"
@array_networks.each do |element|
  puts "Name: " + (element[1].get_network())[0] + " ipv4: " + (element[1].get_network())[1]
end
# Добавление объектов, сетей в компьютеры
i = 0
@array_pc.each do |element|
  ++i
  #element[1].set_host((@array_networks[i])[1].get_network()[1])
  element[1].set_host((@array_networks[i])[1])
end
# Вывод компьютеров с добавленным объектом есть
puts "\nPC's with networks"
@array_pc.each do |element|
  puts "PC: " + (element[1].get_host())[0] + " mac: " + (element[1].get_host())[1] + 
  " brand: " + (element[1].get_host())[2] +  " network: " + ((element[1].get_host())[3]).get_network()[1] + 
  " objects: " + (element[1].class).to_s + "/" + ((element[1].get_host())[3].class).to_s
end
# Запуск меню управления вводом/сохранением файла и/или пользователей 
loop do
  puts "\nInput 'N' to create new users db"
  puts "Input 'D' to work with default users db"
  puts "Input 'E' to work with created users db"
  puts "Input 'q' for exit"
  print "\nYour choice: "
  loop do
    manage_symbol = gets.strip
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
    break if (manage_symbol == 'N' || manage_symbol == 'Y' || manage_symbol == 'q')
   end
   users_db = LocalUsersDb.new(local_path, file_name)
   loop do
   if users_db.create_user() == false
     puts "New user was not created"
   end
   #puts `clear`  
   print "Do you want create new users ? 'y/n': "
   if gets.strip == "n"
     puts `clear`
     #abort "Bye, bye!"
     break
   end
   end
end