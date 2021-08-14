# frozen_string_literal: true

require 'date'

# class News
class News
  include Comparable
  attr_accessor :date, :text, :name

  def initialize(args)
    @date = Date.parse(args[:date])
    @text = args[:text]
    @name = args[:name]
  end

  def <=>(other)
    date <=> other.date
  end
end

fst_news = { date: '2021-10-10', text: 'Good news, good news!!!', name: 'Fantastic news!' }
snd_news = { date: '2021-10-09', text: 'So so news', name: 'Regular news' }
news_one = News.new(fst_news)
news_two = News.new(snd_news)
puts news_one > news_two ? "The freshest news '#{news_one.name}'" : "The freshest news '#{news_two.name}'"
