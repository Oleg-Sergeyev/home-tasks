# frozen_string_literal: true

require 'csv'
require 'find'
require_relative 'lib/myfileutils'

# task 1
# p CSV.read('countries.csv').to_h.map { |k, v| [k.strip, v.to_i] }.to_h

# task 2
colors = { red: 'красный',
           orange: 'оранжевый',
           yellow: 'жёлтый',
           green: 'зеленый',
           blue: 'голубой',
           indigo: 'синий',
           violet: 'фиолетовый' }
# p colors.keys.map(&:to_s)
# p colors.values
# p colors.invert

# task 3
books = { 'Design Patterns in Ruby' => ['Russ Olsen'],
          'Eloquent Ruby' => ['Russ Olsen'],
          'The Well-Grounded Rubyist' => ['David A. Black'],
          'The Ruby Programming Language' => ['David Flanagan', 'Yukihiro Matsumoto'],
          'Metaprogramming Ruby 2' => ['Paolo Perrotta'],
          'Ruby Cookbook' => ['Lucas Carlson', 'Leonard Richardson'],
          'Ruby Under a Microscope' => ['Pat Shaughnessy'],
          'Ruby Performance Optimization' => ['Alexander Dymo'],
          'The Ruby Way' => ['Hal Fulton', 'Andre Arko'] }
array = books.values.flatten.uniq.each_with_object({}) do |author, hash|
  hash[author] = books.select { |k, v| k if v.include?(author) }.keys # .size
end
# array.sort_by { |k, _v| k }.to_h.each { |a, b| puts "#{a} #{b}" }

# task 4

# (*) Создайте метод, который выводит список подкаталогов в текущем каталоге. 
# Рядом с каждым из подкаталогов следует вывести список файлов в нем (с учетом вложенных подкаталогов).

PSEUDONIM = %w[. ..].freeze
path = '/home/oleg/ruby/repo/gb/home-tasks/lesson_25'
# array = Find.find(path).reduce([]) do |arr, file|
#     next file if PSEUDONIM.include?(file.to_s)

#     p hash
#     p file
#     p Dir.children(file)
#     arr << [file.to_s, Dir.children(file)] if File.directory?(file)
# end
array = MyFileUtils.dirs(path).reduce([]) do |arr, dir|
  arr << [dir.split('/').last, Dir.children(dir)] unless dir.start_with?('.')
end

array.each do |dir, content| 
  if content.respond_to?('each')
    puts "#{dir} | #{content.sort_by {} }"
  else
    puts "#{dir} | #{content}"
  end
end
