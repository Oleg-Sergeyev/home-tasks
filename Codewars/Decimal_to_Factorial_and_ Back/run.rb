# frozen_string_literal: true

def dec_2_fact_string(nb)
  arr = []
  (1..nil).reduce(nb) do |memo, num|
    return (arr << memo.remainder(num)).reverse.join if (memo / num).zero?

    arr << (memo.remainder(num).zero? ? 0 : memo.remainder(num))
    memo /= num
    memo
  end
end

def fact_string_2_dec(str)
  str.to_i.digits.each_with_index.reduce(0) do |sum, (val, index)|
    sum += ((1..index).reduce(1, :*) * val)
    sum
  end
end

# 463 = 3×5! + 4×4! + 1×3! + 0×2! + 1×1! + 0×0!
number = 463 # [0, 1, 0, 1, 4, 3]
p dec_2_fact_string(number)

string = '341010'
p fact_string_2_dec(string)
