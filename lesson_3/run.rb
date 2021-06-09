require_relative 'class_exchange_rate'
require 'date'

puts `clear`
puts 'Table for RUB exchange rate, today ' + Date.today.to_s
valutes = %w[USD EUR CNY GBP CHF JPY]
table = ExchangeRate.new(valutes)
i = 0
puts "\n"
table.show.each do |element|
  puts valutes[i] + ' -> ' + element.to_s
  i += 1
end

print "\nEnter email addresses separated by a space: "
input = gets.chomp
