# frozen_string_literal: true

require 'io/console'

def presskey
  print "\nPress any key or 'q' for exit: "
  input = $stdin.getch
  abort 'Bye, bye!' if input == 'q'
  puts `clear`
end
