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

  def show # Метод возвращает массив заданных курсов
    data_parsed = JSON.parse(@data.body)
    @country_valute.map do |country_valute|
      data_parsed.dig('Valute', country_valute, 'Value')
    end
  end

  private

  def connect # Метод создает объект Faraday и возвращает данные полученные от ресурса
    Faraday.get(CENTER_BANK_URL)
  end
end
