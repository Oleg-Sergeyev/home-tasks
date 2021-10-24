# frozen_string_literal: true

def solution(input, markers)
  markers.collect! do |element|
    element == '$' ? '\$' : element
  end
  # input.gsub(
  #   /(\W#{markers.first}.*?(?=\n))|(\W#{markers.last}.*?(?=\n))|(\W#{markers.last}.*(?=#{markers.first})|(\W#{markers.last}.*(?=$)))/m, ''
  # )
  input.gsub(/\s+[#{markers.join}].*/, '')
end
p solution("apples, pears # and bananas\ngrapes\nbananas !apples",
           ['#', '!'])
p solution("a #b\nc\nd $e f g", ['#', '$'])
# result should == "apples, pears\ngrapes\nbananas"
