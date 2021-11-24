# frozen_string_literal: true

require 'faraday'
require 'httparty'
require 'nokogiri'

# Task 2,3
puts "Gem Faraday, total strings: #{Faraday.post('https://gb.ru/courses').body.split("\n").size}"
puts "Gem HTTParty, total strings: #{HTTParty.post('https://gb.ru/courses').body.split("\n").size}"

# Task 4
phones = []
Nokogiri::HTML(Faraday.get('https://gb.ru').body).xpath('//a').each do |tag|
  phones.push(tag.text) if tag.text.match(/^\+|[0-9]|\d/)
end
puts phones.uniq
