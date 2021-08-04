# frozen_string_literal: true

arr = File.open(ARGV.first, 'r').each("\n").map(&:chomp)
puts "\nFile: #{ARGV.first}"
puts "\nRandom string: #{arr[rand(0..arr.size)]}"
