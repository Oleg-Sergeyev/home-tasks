require 'faraday'
require 'faraday_middleware'
require 'json'

# Debug: 
# require "pry"


country_code_src = "USD"
country_code_dst = "RUS"
connection = Faraday.get("http://www.google.com/ig/calculator?hl=en&q=1#{country_code_src}=?#{country_code_dst}")

currency_comparison_hash = eval connection.body #Google's output is not JSON, it's a hash

dst_currency_value, *dst_currency_text = *currency_comparison_hash[:rhs].split(' ')
dst_currency_value = dst_currency_value.to_f
dst_currency_text = dst_currency_text.join(' ')

puts "#{country_code_dst} -> #{dst_currency_value} (#{dst_currency_text} to 1 #{country_code_src})"
#puts country_code_dst#->dst_currency_value #{dst_currency_text} to 1 {country_code_src}