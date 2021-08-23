# frozen_string_literal: true

# def isSumOfCubes(s)
#   cubes = (0..9).to_a.map { |el| el**3 }
#   array = cubes.map do |el|
#     cubes.map do |el2|
#       cubes.reduce([]) do |memo, el3|
#         memo << (el + el2 + el3)
#       end
#     end
#   end.flatten
#   array.uniq!.select! { |el| (0..1000).include?(el) }
#   res = []
#   s.scan(/[0-9]\d*/).each do |str|
#     res << str.to_i if str.to_i.zero? || str.to_i == 1
#     str.scan(/(\d{3})/).each do |num|
#       res << num.join.to_i if array.include?(num.join.to_i)
#     end
#   end.flatten.compact
#   if res.size <= 2
#     "#{res.join(' ')} Lucky"
#   elsif res.size >= 3
#     "#{(res << res.sum).join(' ')} Lucky"
#   else
#     'Unlucky'
#   end
# end

def isSumOfCubes(s)
  res = s.scan(/\d{1,3}/).map(&:to_i).select { |num| num == num.digits.reduce(0) { |sum, v| sum + v**3 } }
  res.empty? ? 'Unlucky' : "#{(res << res.sum).join(' ')} Lucky"
end
# def isSumOfCubes(s)
#     p s.scan(/\d{1,3}/)
#   a = s.scan(/\d{1,3}/).map(&:to_i).select { |num| num == num.digits.reduce(0) { |res, n| res += n**3 } }

#   a.empty? ? 'Unlucky' : "#{a.join(' ')} #{a.reduce(:+)} Lucky"
# end
#string = 'n_kj 0f3178.jd(kd)(153.fb372m1,9845112 0455-erjk1'
#string = '0 9026315 -827&()'
#string = 'Once 1000upon a 1000midnight dreary, while100 I pondered, 9026315weak and weary -827&()'
#string = '&z _upon 407298a --- ???ry, ww/100 I thought, 631str*ng and w===y -721&()'
string = '000000aloquit 137z&-and 9926315strong weary'
#Test.assert_equals(isSumOfCubes("0 9026315 -827&()"), "0 902 Lucky") 
#string = 'aqdf&0#1xyz!22[153(777.777'
puts isSumOfCubes(string)
