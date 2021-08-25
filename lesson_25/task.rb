# frozen_string_literal: true

require 'csv'
require_relative 'lib/myfileutils'

puts `clear`
# task 1
puts 'Task 1'
p CSV.read('countries.csv').to_h.map { |k, v| [k.strip, v.to_i] }.to_h

# task 2
puts 'Task 2'
colors = { red: 'красный',
           orange: 'оранжевый',
           yellow: 'жёлтый',
           green: 'зеленый',
           blue: 'голубой',
           indigo: 'синий',
           violet: 'фиолетовый' }
p colors.keys.map(&:to_s)
p colors.values
p colors.invert

# task 3
puts 'Task 3'
books = { 'Design Patterns in Ruby' => ['Russ Olsen'],
          'Eloquent Ruby' => ['Russ Olsen'],
          'The Well-Grounded Rubyist' => ['David A. Black'],
          'The Ruby Programming Language' => ['David Flanagan', 'Yukihiro Matsumoto'],
          'Metaprogramming Ruby 2' => ['Paolo Perrotta'],
          'Ruby Cookbook' => ['Lucas Carlson', 'Leonard Richardson'],
          'Ruby Under a Microscope' => ['Pat Shaughnessy'],
          'Ruby Performance Optimization' => ['Alexander Dymo'],
          'The Ruby Way' => ['Hal Fulton', 'Andre Arko'] }
authors = books.values.flatten.uniq.each_with_object({}) do |author, hash|
  hash[author] = books.select { |k, v| k if v.include?(author) }.keys # .size
end
authors.sort_by { |k, _v| k }.to_h.each { |a, b| puts "#{a} #{b}" }

# task 4
puts 'Task 4'
path = '/home/oleg/ruby/repo/gb/home-tasks/lesson_25'
array = MyFileUtils.dirs(path).reduce([]) { |arr, dir| arr << [dir, Dir.children(dir)] }
array.to_h.sort.each { |dir, file| puts "#{dir}: #{file.join(',')}" }

# task 5
puts 'Task 5'
MyFileUtils.clear_dirs # kludge... clear instance array

path = '/home/oleg/ruby/repo/gb/home-tasks/lesson_25/tmp1'
dirs = MyFileUtils.dirs(path).reduce([]) { |arr, dir| arr << [dir, Dir.children(dir)] }

MyFileUtils.replace(dirs, 'SuperClass', 'NewClass')
