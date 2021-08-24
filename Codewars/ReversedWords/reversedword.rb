# frozen_string_literal: true

def solution(sentence)
  sentence.split(' ').reverse.join(' ')
end

string = 'The greatest victory is that which requires no battle'
p solution(string)
