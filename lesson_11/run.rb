# frozen_string_literal: true

require_relative 'lib/user'

# 1
def input_color(arr)
  puts `clear`
  print "\nInput color: "
  color = gets.chomp
  if color != 'stop'
    arr.push(color)
    input_color(arr)
  end
  puts `clear`
  arr
end

colors = []
p "Original array = #{input_color(colors)}"

# 2
puts "\n\nTask 2"
# colors = ['green', 'braun', '', 'red', '', 'white', 'black']
print "\nRemoved empty items and re-sorted = #{colors.reject(&:empty?).sort}"

# 3
puts "\n\nTask 3"
print "\nWords with 't' = #{%w[cat dog tiger].select { |str| str.include?('t') }}"

# 4
puts "\n\nTask 4"
def upchar(str)
  str.chars.each_with_index { |value, i| value.replace(value.upcase) if i.zero? }.join('')
end
# puts `clear`
print "\n\nOriginal array = [\"cat\", \"dog\", \"tiger\"]"
print "\n\nUppercase = #{%w[cat dog tiger].map { |str| upchar(str) }}"

# 5
puts "\n\nTask 5"
puts "\n"
print(%w[Понедельник Вторник Среда Четверг Пятница Суббота Воскресенье].select { |str| str.start_with?('С') })

# 6
puts "\n\nTask 6"
months = %w[Январь Февраль Март Апрель Май Июнь Июль Сентябрь Октябрь Ноябрь Декабрь]

def max_hash_key(hash)
  hash.max_by { |_key, value| value }
end

def min_hash_key(hash)
  hash.min_by { |_key, value| value }
end

print "\nMax month = #{max_hash_key(Hash[months.map { |month| [month, month.size] }])}"
print "\nMin month = #{min_hash_key(Hash[months.map { |month| [month, month.size] }])}"

# 7
puts "\n\nTask 7"
print "\n#{'Hello world!'.chars}"

# 8
puts "\n\nTask 8"
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
USERS.each { |arr| p arr}
users = USERS.each_with_object({}) do |(name, score), collection|
  user = User.new(name, score)
  collection[user] = user
end
average_rating = users.values.map(&:score).sum / USERS.size
puts "\nAverage raiting = #{average_rating}\n\nUsers with more than '#{average_rating}' rating:"
puts "\n"
users.select { |user, _score| puts "#{user.name} #{user.score}" if user.score > average_rating }

# 9
puts "\n\nTask 9"
PLANETS = { 'Венера'	=> 4.81068,
            'Земля' => 5.97600,
            'Луна' =>	0.07350,
            'Марс' =>	0.63345,
            'Меркурий' => 0.32868,
            'Нептун'	=> 101.59200,
            'Плутон'	=> 0.01195,
            'Сатурн'	=> 561.80376,
            'Солнце'	=> 1_989_000.00,
            'Уран'	=> 86.05440,
            'Юпитер'	=> 1876.64328 }.freeze
puts "\nPlantes:"
PLANETS.each { |planet| p planet }
puts "\nTop 3 heaviest planets: "
PLANETS.sort_by { |_key, value| value }.reverse.each_with_index { |value, i| p value if i <= 2 }
puts "\nTop 3 lightest plantes: "
PLANETS.sort_by { |_key, value| value }.each_with_index { |value, i| p value if i <= 2 }
