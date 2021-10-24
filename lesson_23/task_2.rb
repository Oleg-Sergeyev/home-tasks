# frozen_string_literal: true

file = File.open('strings.txt', 'r')
hash = {}
file.each do |string|
  string.split(' ').each do |word|
    if hash.include?(word) && !hash.empty?
      index = hash[word]
      index += 1
      hash[word] = index
    else
      hash[word] = 1
    end
  end
end

hash.sort.each { |word, num| puts "#{word}(#{num})" }
