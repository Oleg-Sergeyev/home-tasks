# frozen_string_literal: true

def dec_2_fact_string(nb)
  arr = []
  code = (0..9).to_a.concat(('A'..'Z').to_a)
  #if nb >= 36288000
  code.each_with_index.reduce(nb) do |memo, (num, index)|
    p num
    return (arr << memo.remainder(num + 1)).reverse.join if (memo / (num + 1)).zero?

    arr << (memo.remainder(num + 1).zero? ? 0 : memo.remainder(num + 1))
    memo /= num + 1
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
number = 3628799 # [0, 1, 0, 1, 4, 3]
p dec_2_fact_string(number)

string = '341010'
p fact_string_2_dec(string)

# number = 36288000
# number = 371993326789901217467999448150835199999999
# Expected: "A0000000000", instead got: "100000000000"
# Expected: "ZYXWVUTSRQPONMLKJIHGFEDCBA9876543210", 
# instead got: "3534333231302928272625242322212019181716151413121110987654321