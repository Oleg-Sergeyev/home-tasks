require 'faraday'
require 'faraday_middleware'
require 'json'

# class ExchangeRate
class ExchangeRate
  def initialize(valute)
    @country_valute = valute
    @data = connect
  end

  def show # Метод возвращает массив заданных курсов
    data_parsed = JSON.parse(@data.body)
    array = []
    @country_valute.each do |country_valute|
      array.push(((data_parsed ['Valute'])[country_valute])['Value'])
    end
    array
  end

  private

  def connect # Метод создает объект Faraday и возвращает данные полученные от ресурса
    Faraday.get('https://www.cbr-xml-daily.ru/daily_json.js')
  end
end
