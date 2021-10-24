# frozen_string_literal: true

require_relative 'lib/local_email'
require_relative 'lib/exchange_rate'

# EMAILS = File.open(__dir__ + '/db/emails.db', 'r')
email = LocalEmail.new('smtp@dvpweb.ru', 'mr.stown@yandex.ru', 'exchange rate')
valutes = %w[USD EUR CNY GBP CHF JPY]
table = ExchangeRate.new(valutes)
i = 0
str = ''
table.show.each do |element|
  str = "#{str}#{valutes[i]} -> #{element} "
  i += 1
end
email.message(str)
email.send
