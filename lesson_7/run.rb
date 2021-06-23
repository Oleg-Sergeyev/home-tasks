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
abort BYE
