require_relative 'lib/local_email'
require_relative 'lib/telemetry'
require 'fileutils'
require 'zip'
require 'io/console'
require 'io/wait'

def presskey
  print "Press any key or 'q' for exit: "
  input = STDIN.getch
  abort 'Bye, bye!' if input == 'q'
  puts `clear`
end

puts `clear`
puts 'Задание 1'
pi = 3.1415926535
puts "Округление pi=#{pi} до pi=#{pi.round(2)}"

presskey

puts "\nЗадание 2"
week = %w[Понедельник Вторник Среда Четверг Пятница Суббота Воскресенье]
week.each do |day|
  puts day
end

presskey

puts "\nЗадание 3"
colors = {
  red: 'красный',
  orange: 'оранжевый',
  yellow: 'желтый',
  green: 'зеленый',
  blue: 'голубой',
  indigo: 'индиго',
  violet: 'фиолетовый'
}
colors.each do |key, value|
  puts ":#{key} => #{value}"
end

presskey

puts "\nЗадание 4"
puts "'Hello' reverse -> #{"'Hello'".reverse}"

presskey

puts "\nЗадание 5"
puts "' Hello world ' allstrip -> #{' Hello world '.strip}"

presskey

puts "\nЗадание 6"
puts 'hellow world!'

presskey

puts "\nЗадание 7"
colors = {
  red: 1,
  orange: 2,
  yellow: 3,
  green: 4,
  blue: 5,
  indigo: 6,
  violet: 7
}
k = rand(1..7)
colors.each do |key, value|
  if k == value
    puts "Случайный цвет: #{key}"
    break
  end
end

presskey

puts "\nЗадание 8"
x1 = 3
x2 = -1
y1 = 7
y2 = 5

puts "Расстояние между двумя точками: #{Math.sqrt((x2 - x1)**2 + (y2 - y1)**2).round(2)} ед."

presskey

puts "\nЗадание 'Получение и отправка лога двух системных команд' в формате JSON"

presskey
puts 'Please waite'
hardware = Telemetry.new
hardware.export

STR = 'Generated report on the composition of the computer and settings of network interfaces'.freeze
FOLDER = Dir.pwd.to_s + '/.report/'.to_s
INPUT_FILENAMES = ['hardware.json', 'ethernet.json'].freeze
ZIPFILENAME = 'report.zip'.freeze
ZIPFILE = FOLDER.to_s + ZIPFILENAME.to_s

Zip::File.open(ZIPFILE, Zip::File::CREATE) do |zip_file|
  INPUT_FILENAMES.each do |file_name|
    zip_file.add(file_name, File.join(FOLDER, file_name))
  end
  zip_file.get_output_stream('reportFile') { |f| f.write 'hardware.json', 'ethernet.json' }
end

email = LocalEmail.new('smtp@dvpweb.ru', 'sergeyev_ov@mail.ru', 'Hardware report')
filecontent = File.read(ZIPFILE)

puts 'Report sent' if email.send_mail(STR, filecontent, ZIPFILENAME)
FileUtils.rm_r FOLDER, force: true
