require_relative 'class_exchange_rate'
require 'date'
require 'pry-byebug'

binding.pry
d = DateTime.now
puts `clear`
puts 'Ruble exchange rate table for today ' + d.strftime('%m/%d/%Y at %H:%M').to_s
valutes = %w[USD EUR CNY GBP CHF JPY]
table = ExchangeRate.new(valutes)
i = 0
puts "\n"
table.show.each do |element|
  puts valutes[i] + ' -> ' + element.to_s
  i += 1
end
