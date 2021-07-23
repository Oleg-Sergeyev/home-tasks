# frozen_string_literal: true

require 'io/console'
require 'io/wait'

# class InputChar
class InputChar
  INFO = "\nYou can press 'backspase' to delete words/chars. And input ':' to exit"
  INTERED_DATA = "\n\nPlease, input word :"
  attr_accessor :getstr

  def initialize(str_res)
    puts `clear`
    print INFO
    clear_stdin
    @getstr = input_str(str_res)
  end

  def input_str(str)
    print "\n\nTranslate: '#{viewwords(str).res_str}'"
    print "#{INTERED_DATA} #{str}"
    key = $stdin.getch.chomp
    return str if key == "\e"

    abort "\nInputed symbol ':' to exit." if key == ':'
    if key == "\c?"
      str = str[0...-1]
      return str
    end
    "#{str}#{key}"
  end

  def clear_stdin
    $stdin.getc while $stdin.ready?
  end

  def viewwords(str)
    ViewWords.new(str)
  end
end
