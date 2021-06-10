require_relative 'lib/local_email'
require_relative 'lib/exchange_rate'

email = LocalEmail.new('smtp@dvpweb.ru', 'sergeyev_ov@mail.ru', 'exchange rate')
valutes = %w[USD EUR CNY GBP CHF JPY]
table = ExchangeRate.new(valutes)
i = 0
str = ''
table.show.each do |element|
  str = str + valutes[i] + ' -> ' + element.to_s + ' '
  i += 1
end
email.message(str)
email.send
