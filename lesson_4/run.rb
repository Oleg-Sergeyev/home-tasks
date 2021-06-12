require 'json'

PATH = __dir__.to_s + '/tmp'.to_s
FILE_LOG = PATH + '/hardware.log'.freeze
FILE_JSON = PATH + '/export.json'.freeze
if Dir.exist?(PATH) == false
  Dir.mkdir(PATH)
else
   if File.exist?(FILE_LOG)
     File.delete(FILE_LOG)
   end
   if File.exist?(FILE_JSON)
    File.delete(FILE_JSON)
   end
end

file_log = File.new(FILE_LOG, 'w')
file_log.write(`lspci -v`)
file_log.close

file_log = File.new(FILE_LOG, 'r:UTF-8')
lines = file_log.readlines

main_arr = []
param_arr = []
dev = ''
lines.each do |string|
  string = string.gsub /^$\n/, ''
  string.each_line do |str|
    if !str.start_with?("\t") || !str.start_with?('')
      if param_arr.empty? != true
        main_arr.push(dev => param_arr)
        param_arr = []
      end
      dev = str[0..7].rstrip!
      param_arr.push(
        str.gsub(str[0..7], '').lines(':')[0].chop.gsub(' ', '_').downcase =>
        str.gsub(str[0..7], '').lines(':')[1].chop.lstrip!.downcase
      )
      else
        if str.gsub(str[0], '').lines(':')[1].nil? == false
          param_arr.push(
            str.gsub(str[0], '').lines(':')[0].chop.gsub(' ', '_').downcase =>
            str.gsub(str[0], '').lines(':')[1].chop.lstrip!.downcase
          )
          else
            param_arr.push(str.gsub(str[0], '').chop => 'NA')
        end
    end
  end
end
File.open(FILE_JSON, 'wb') { |json_file| json_file.puts JSON.pretty_generate(main_arr) }
File.delete(FILE_LOG)
