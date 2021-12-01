# frozen_string_literal: true

def get_array(file)
  File.read(file)[1..-1].chop.split(',').map(&:lstrip)
end

puts get_array('lib/rc_arr') - get_array('lib/irb_arr') # .size

# IRB/RC
# 3.0.0 :001 > file = File.new('irb_arr', 'w') # 'rc_arr'
# => #<File:irb_array_locla_path>
# 3.0.0 :002 > file << $LOAD_PATH
# => #<File:irb_array_locla_path>
# 3.0.0 :003 > exit
