# frozen_string_literal: true

@colors = { 1 => 'красный', 2 => 'оранжевый', 3 => 'желтый', 4 => 'зеленый', 5 => 'голубой', 6 => 'синий', 7 => 'фиолетовый' }

# def def_color(num_color)
#   @colors.each do |key, value|
#     puts "Color is: #{value}" if key == num_color
#   end
# end

def def_color(num_color)
  return nil unless (1..7).include?(num_color)

  "\nColor is: #{@colors[num_color]}"
end

puts def_color(5)
p def_color(25)
p def_color('any string')
