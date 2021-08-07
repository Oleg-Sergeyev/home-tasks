# frozen_string_literal: true

require 'exifr/jpeg'

p EXIFR::JPEG.new('img/5.jpg').date_time
p EXIFR::JPEG.new('img/5.jpg').width
p EXIFR::JPEG.new('img/5.jpg').height
