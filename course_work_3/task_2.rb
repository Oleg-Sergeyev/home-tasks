# frozen_string_literal: true

require 'exifr/jpeg'

# Если в открытом виде записано :)
# puts `clear`
# # Task 2
# puts "\nTask 2"
# arr = File.readlines('img/1.jpg').map(&:chomp)
# # puts arr
# string = ''
# arr.each { |v| string = v if v.include?('<x:xmpmeta') }
# puts string.split(' ').pop(2).first

p EXIFR::JPEG.new('img/5.jpg').date_time
p EXIFR::JPEG.new('img/5.jpg').width
p EXIFR::JPEG.new('img/5.jpg').height
