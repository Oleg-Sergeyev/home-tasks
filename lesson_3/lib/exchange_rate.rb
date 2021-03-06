# frozen_string_literal: true

require 'faraday'
require 'faraday_middleware'
require 'json'

# class ExchangeRate
class ExchangeRate
  CENTER_BANK_URL = 'https://www.cbr-xml-daily.ru/daily_json.js'
  def initialize(valute)
    @country_valute = valute
    @data = connect
  end

  # Метод возвращает массив заданных курсов
  def show
    data_parsed = JSON.parse(@data.body)
    @country_valute.map do |country_valute|
      data_parsed.dig('Valute', country_valute, 'Value')
    end
  end

  private

  # Метод создает объект Faraday и возвращает данные полученные от ресурса
  def connect
    Faraday.get(CENTER_BANK_URL)
  end
end
