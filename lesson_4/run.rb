#
#info = `lspci -v | grep Audio`
#info = `lspci -v`
#puts info.class
#file = File.new('info.txt', 'w')
#file.write(info)
#info.each_line(chomp: true) { |string|
#puts string.split('\n').first
#}
#info.each_line(chomp: true) { |string|
#print string[1]
#}
#File.open('logfile.txt', 'r').each do |string|
 #puts string.split('\n').first
# print string
#end
file_path = "/home/oleg/ruby/repo/gb/home-tasks/lesson_4/logfile.txt"
f = File.new(file_path, 'r:UTF-8')
lines = f.readlines


#puts lines.sample
#puts lines[0].lines(':')[1]
lines.each do |string|
    string = string.gsub /^$\n/, ''
    string.each_line do |str|
    #print str[0]
      if !str.start_with?("\t") || !str.start_with?("")
        #puts str.gsub(str[0..7],"")
        puts str.gsub(str[0..7],"").lines(':')[0].chop.gsub(" ", "_").downcase
        #puts str.join('_')
      else
        puts str.gsub(str[0],"").lines(':')[0].chop.gsub(" ", "_").downcase
      end
  end
end
