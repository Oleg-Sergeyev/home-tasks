# frozen_string_literal: true

puts `clear`

# Task 1
puts "\nTask1"
puts %i[first second third].product.each_with_index { |element, index| element.push(index + 1) }.to_h

# Task 2
puts "\nTask2"
KEYS = %w[first second third].freeze
VALUES = KEYS.each_with_index.map do |word, index|
  "#{word.split(/^(.).*(..)$/).join.capitalize} (#{index + 1})"
end
puts KEYS.map(&:to_sym).zip(VALUES).to_h
# puts %w[first second third].map(&:to_sym).zip(['Fst (1)', 'Snd (2)', 'Trd (3)']).to_h

# Task 3
puts "\nTask3"
STR3 = "Возьмите текст этого задания и извлеките из него все слова,
количество символов в которых больше 5. Подсчитайте количество слов и выведите их алфавитном порядке."
ARR3 = STR3.split(/[\s,.']/).select { |word| word.size > 5 }.map(&:downcase).sort
puts "Количество слов '#{ARR3.size}'"
puts ARR3

# Task 4
puts "\nTask4"
STR4 = "Возьмите текст этого задания и извлеките из него все слова, которые начинаются с символа 'и'.
Сформируйте из них список уникальных слов и выведите их в порядке увеличения количества символов в слове."
puts STR4.split(/[\s,.']/).select { |word| word.start_with?('и') }.uniq.sort { |a, b| b.size <=> a.size }

# Task 5
puts "\nTask 5"
KEYS = %w[red orange yellow green gray indigo violet].freeze
VALUES = %w[красный оранжевый желтый зеленый голубой синий фиолетовый].freeze
puts KEYS.map(&:to_sym).zip(VALUES).to_h

# Task 6
puts "\nTask 6"
puts "100 in binary = '#{format('%b', 100)}'"
puts "144 in octal = '#{format('%o', 144)}'"
puts "64 in hex = '#{format('%x', 64)}'"
