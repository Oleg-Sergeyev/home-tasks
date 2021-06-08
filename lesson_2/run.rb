require_relative 'ClassLocalUsersDb'
require_relative 'ClassLocalHosts'
require_relative 'ClassLocalNetworks'
require_relative 'ClassCliMenu'


# 'Загрузка' компьютеров в массив
hosts = CSV.read(__dir__ + '/db/pc_list.csv')
hosts.shift
@array_pc = []
hosts.each do |element|
  new_pc = LocalHosts.new(element[0], element [1], element[2]) # Создание объекта 'компьютер'
  _array = [element[0], new_pc]
  @array_pc.push(_array)
end
# 'Загрузка' сетей в массив
networks = CSV.read(__dir__ + '/db/networks_list.csv')
networks.shift
@array_networks = []
networks.each do |element|
  new_network = LocalNetworks.new(element[0], element [1]) # Создание объекта 'сеть'
  _array = [element[0], new_network]
  @array_networks.push(_array)
end

local_path = __dir__ + '/db/'
file_name = ''
# puts `clear`
puts "Welcome to 'USERS MANAGER' \nYou can create new users database, create new users, save it."
# puts "Also you can upload users db to computers."
puts "\nComputers list"
# Вывод компьютеров
@array_pc.each do |element|
  puts 'PC: ' + element[1].get_host[0] + ' mac: ' + element[1].get_host[1] + ' brand: ' + element[1].get_host[2]
end
# Вывод сетей
puts "\nNetworks list"
@array_networks.each do |element|
  puts 'Name: ' + element[1].get_network[0] + ' ipv4: ' + element[1].get_network[1]
end
# Добавление объектов, сетей в компьютеры
i = 0
@array_pc.each do |element|
  ++i
  # element[1].set_host((@array_networks[i])[1].get_network()[1])
  element[1].set_host((@array_networks[i])[1])
end
# Вывод компьютеров с добавленным объектом есть
puts "\nPC's with networks"
@array_pc.each do |element|
  puts 'PC: ' + element[1].get_host[0] + ' mac: ' + element[1].get_host[1] +
       ' brand: ' + element[1].get_host[2] +  ' network: ' + element[1].get_host[3].get_network[1] +
       ' objects: ' + element[1].class.to_s + '/' + element[1].get_host[3].class.to_s
end
# Запуск меню управления вводом/сохранением файла и/или пользователей
# Проба меню
loop do
MAIN_MENU = File.open(__dir__ + '/db/menu', 'r')
main_menu = CliMenu.new(MAIN_MENU, 'Your choice: ' , ['D', 'E', 'N', 'Q'])
#puts main_menu.show
control = main_menu.choice
#puts control
if control == 'D'
  file_name = 'users.csv'
end
if control == 'N' || control == 'E'
  print 'Input file name w/o extension: '
  file_name = gets.strip + '.csv'
end
abort 'Bye, bye!' if control == 'Q'

users_db = LocalUsersDb.new(local_path, file_name)

  puts 'New user was not created' if users_db.create_user == false
  # puts `clear`
  print "Do you want create new users ? 'y/n': "
  next unless gets.strip == 'n'

  puts `clear`
  # abort "Bye, bye!"
  break
end