# frozen_string_literal: true

require_relative 'lib/functions'

clear
puts EX1
puts format("\nPi = %.2f", 3.14159265358979)
presskey

clear
puts EX2
fst = 10
snd = 20
fst, snd = snd, fst
puts "\nfst = #{fst} snd = #{snd}"
presskey

clear
puts EX3
print "\nInput number: "
number = gets.strip
number = number.to_i
puts 'Number iz zero' if number.zero?
if (format('%b', number))[-1].to_i.zero?
  print "Число четное = '"
else
  print "Число нечетное = '"
end
print "#{format('%b', number)}'"
presskey

clear
puts EX4
print "\nInput number: "
number = gets.strip
number = number.to_i
if (number & 1).zero?
  print "Число четное = '"
else
  print "Число нечетное = '"
end
print "#{format('%b', number)}'"
presskey

puts 'Вычисление адреса сети и битности маски'
# print 'Input ip address (4x) xxx.xxx.xxx.xxx: '
ip = '192.168.10.25' # gets.chomp
ip_mask = '255.255.255.0'
ip_net_arr = []
ip_arr = ip.split('.')
ip_mask_arr = ip_mask.split('.')
puts "\nIP #{ip_arr}"
ip_arr.each do |oktet|
  print format('%08b ', oktet).to_s
end
puts "\nMask #{ip_mask_arr}"
ip_mask_arr.each do |oktet|
  print format('%08b ', oktet).to_s
end
(0..3).each do |element|
  ip_net_arr.push("#{ip_mask_arr[element].to_i & ip_arr[element].to_i} ")
end
print "\nNet #{ip_net_arr}"
puts "\n"
(0..3).each do |element|
  print "#{format('%08b', ip_mask_arr[element].to_i & ip_arr[element].to_i)} "
end
