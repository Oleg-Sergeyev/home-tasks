# frozen_string_literal: true

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
puts `clear`
print "\n#{'Hello world!'.chars}"
puts "\n\n"
