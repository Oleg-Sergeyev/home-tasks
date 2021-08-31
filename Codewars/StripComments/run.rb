# frozen_string_literal: true

def solution(string, params)
  # p string.scan(/\w+/)
  # p string.sub(/.(?<=#).*?(?=\\n)/, '')
  # p string.sub(/(#{params.first}.*?)\n/m, "\n")
  # p string[/(#{params.first}.*?)\n/m, 1]
  p string.scan(/(#{params.first}.*?)\n/m)
end
solution("apples, pears # and bananas\ngrapes\nbananas !apples apples, pears # and bananas\ngrapes\nbananas !apples",
         ['#', '!'])
# result should == "apples, pears\ngrapes\nbananas"
