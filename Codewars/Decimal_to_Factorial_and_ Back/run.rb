# frozen_string_literal: true

NUMS = (0..9).to_a.concat(('A'..'Z').to_a).freeze

def dec_2_fact_string(nb)
  arr = []
  NUMS.each_with_index.reduce(nb) do |memo, (_num, index)|
    return (arr << NUMS.at(memo.remainder(index + 1))).reverse.join if (memo / (index + 1)).zero?

    arr << (memo.remainder(index + 1).zero? ? 0 : NUMS.at(memo.remainder(index + 1)))
    memo /= index + 1
    memo
  end
end

def fact_string_2_dec(str)
  str.chars.reverse!.each_with_index.reduce(0) do |sum, (val, index)|
    val = val.to_i if (48..57).include? val.ord
    sum += ((1..index).reduce(1, :*) * NUMS.index(val))
    sum
  end
end

number = 463 # '341010'
p dec_2_fact_string(number)

string = 'ZYXWVUTSRQPONMLKJIHGFEDCBA9876543210' # 371993326789901217467999448150835199999999
# string = '341010' # 463
p fact_string_2_dec(string)

# number: 36288000 => "A0000000000"
# number: 371993326789901217467999448150835199999999 => "ZYXWVUTSRQPONMLKJIHGFEDCBA9876543210"

# 463 = 3×5! + 4×4! + 1×3! + 0×2! + 1×1! + 0×0!
