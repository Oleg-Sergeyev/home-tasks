File1 = '/home/oleg/ruby/repo/gb/home-tasks/lesson_14/run.rb'.freeze
# Kernel.exec '/bin/bash', '-c', "ruby #{File1} #{ARGV.join(' ')}"
Kernel.exec '/bin/bash', '-c', "ruby #{File1}"
