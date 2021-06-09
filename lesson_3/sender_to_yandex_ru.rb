require_relative 'class_local_email'
require_relative 'class_exchange_rate'

#EMAILS = File.open(__dir__ + '/db/emails.db', 'r')
email = LocalEmail.new('ruby_code@mail.com', '******@yandex.ru', 'exchange rate')
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
