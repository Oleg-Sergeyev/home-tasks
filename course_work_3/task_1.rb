# frozen_string_literal: true

require 'fileutils'
require_relative 'lib/randomtext'

file_name = 'tmp_task_1/random.txt'
FileUtils.rm_rf('tmp_task_1/.', secure: true)
file = File.new(file_name, 'a')
size = rand(1..1_500)
file << RandomText.new(size).text
file.close

FILES_COUNT = 10
file_size = File.new(file_name).size
puts "Generated original file, size: #{file_size} bytes"
abort "File #{file_name}.size < #{FILES_COUNT} bytes" if File.new(file_name).size < FILES_COUNT

string = File.readlines(file_name).join
chars = file_size / FILES_COUNT
chars_rem = file_size % FILES_COUNT
index = 1
until string.empty?
  if !chars_rem.zero?
    file = File.new("#{file_name}_x#{format('%02d', index.to_s)}", 'a') << string.slice!(0..chars)
    chars_rem -= 1
    file.close
  else
    file = File.new("#{file_name}_x#{format('%02d', index.to_s)}", 'a') << string.slice!(0..(chars - 1))
  end
  file.close
  index += 1
end
puts 'Files created .txt_xXX'
Dir.children('tmp_task_1').sort.each { |f| puts "#{f} #{File.new('tmp_task_1/'"#{f}").size} bytes" }
