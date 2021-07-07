# frozen_string_literal: true

require_relative 'user'

# 1
# def input_color(arr)
#   puts `clear`
#   print "\nInput color: "
#   color = gets.chomp
#   if color != 'stop'
#     arr.push(color)
#     input_color(arr)
#   end
#   arr
# end

# colors = []
# p "Original array = #{input_color(colors)}"

# 2
# puts `clear`
# colors = ['green', 'braun', '', 'red', '', 'white', 'black']
# print "\nRemoved empty items and re-sorted = #{colors.reject(&:empty?).sort}"

# 3
# puts `clear`
# print "\nWords with 't' = #{%w[cat dog tiger].select { |str| str.include?('t') }}"

# 4
# def upchar(str)
#   str.chars.each_with_index { |value, i| value.replace(value.upcase) if i.zero? }.join('')
# end
# puts `clear`
# print "\n\nOriginal array = [\"cat\", \"dog\", \"tiger\"]"
# print "\n\nUppercase = #{%w[cat dog tiger].map { |str| upchar(str) }}"
# puts "\n\n"

# 5
# print(%w[Понедельник Вторник Среда Четверг Пятница Суббота Воскресенье].select { |str| str.start_with?('С') })

# 6
# puts `clear`
# months = %w[Январь Февраль Март Апрель Май Июнь Июль Сентябрь Октябрь Ноябрь Декабрь]

# def max_hash_key(hash)
#   hash.max_by { |_key, value| value }
# end

# def min_hash_key(hash)
#   hash.min_by { |_key, value| value }
# end

# print "\nMax month = #{max_hash_key(Hash[months.map { |month| [month, month.size] }])}"
# print "\nMin month = #{min_hash_key(Hash[months.map { |month| [month, month.size] }])}"
# puts "\n"

# 7
# puts `clear`
# print "\n#{'Hello world!'.chars}"
# puts "\n\n"

# 8
puts `clear`
USERS = { 'Петров Петр Петрович' => 3,
          'Сидоров Сергей Александрович' => 4,
          'Макарычев Дмитрий Сергеевич' => 4,
          'Петрушин Михаил Анатольевич' => 2,
          'Александрова Татьяна Сергеевна' => 5,
          'Михалкова Екатерина Андреевна' => 3,
          'Сухороков Андрей Викотрович' => 5,
          'Стрельцова Ольга Петровна' => 1,
          'Троянов Анатолий Генадьевич' => 3 }.freeze
puts "\nUsers with ratings:"
puts "\n"
USERS.each do |arr|
  p arr
end
users = USERS.each_with_object({}) do |(name, score), collection|
  user = User.new(name, score)
  collection[user] = user
end
average_rating = users.values.map(&:score).sum / USERS.size
puts "\nAverage raiting = #{average_rating}\n\nUsers with more than '#{average_rating}' rating:"
puts "\n"
users.select { |user, _score| puts "#{user.name} #{user.score}" if user.score > average_rating }
