require 'io/console'

def presskey
  print "\nPress any key or 'q' for exit: "
  input = STDIN.getch
  abort 'Bye, bye!' if input == 'q'
  puts `clear`
end
