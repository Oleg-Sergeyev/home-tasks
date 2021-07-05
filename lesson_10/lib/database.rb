# frozen_string_literal: true

require 'mysql2'
require 'dotenv/load'
require 'json'

# class DataBase
class DataBase
  attr_accessor :connetion, :tasks

  def initialize(lesson_id)
    @full_array = []
    @connetion = connect
    @tasks_array = get_hometasks(lesson_id)
    create_constants
    @tasks = [TASK1, TASK2, TASK3, TASK4]
  end

  def connect
    Mysql2::Client.new(host: ENV['HOST'],
                       username: ENV['LOGIN'],
                       password: ENV['PASS'],
                       database: ENV['DB'],
                       port: 3306)
  end

  def get_hometasks(id)
    results = @connetion.query("SELECT * FROM ruby_hometasks WHERE lesson_id = #{id}")
    results.each(as: :array) do |row|
      @full_array.push(row)
    end
  end

  def create_constants
    @full_array.each do |data|
      Kernel.const_set("TASK#{data[1]}", [Kernel.const_set("TASK#{data[1]}_SESCIPTION", data[3]),
                                          Kernel.const_set("INPUTS#{data[1]}", parse_str(data[4], data[5])),
                                          data[1]])
    end
  end

  def parse_str(str, str2)
    arr = []
    p str2
    JSON.parse(str).each do |_key, value|
      arr.push(value)
    end
    if str2 != 'null'
      arr2 = []
      JSON.parse(str2).each do |_key, value|
        arr2.push(value)
      end
      arr.push(arr2)
    end
    arr
  end
end
