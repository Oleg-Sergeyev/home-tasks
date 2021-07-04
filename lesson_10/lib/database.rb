# frozen_string_literal: true

require 'mysql2'
require 'dotenv/load'

# class DataBase
class DataBase
  def initialize
    print
  end

  def print
    client = Mysql2::Client.new(host: ENV['HOST'],
                                username: ENV['LOGIN'],
                                password: ENV['PASS'],
                                database: ENV['DB'],
                                port: 3306)
    @results = client.query('SELECT * FROM ruby_hometasks WHERE lesson_id = 10')
    @results.each do |row|
      p row
    end
  end
end
