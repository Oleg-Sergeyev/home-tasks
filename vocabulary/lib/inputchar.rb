# frozen_string_literal: true

require 'io/console'
require 'io/wait'

# class InputChar
class InputChar
  attr_accessor :getstr

  def initialize(str_res)
    print_header
    clear_stdin
    @getstr = get_str(str_res).downcase
  end

  def print_header
    puts `clear`
    print WELCOME
    print INFO
  end

  def get_str(str)
    viewwords(str)
    print "#{INTERED_DATA} #{str}"
    key = input_char
    return str if check_input_key(key, str)

    if key == "\c?"
      str = str[0...-1]
      return str
    end
    "#{str}#{key}"
  end

  def check_input_key(key, str)
    true if IGNORE_KEY.include?(key) || (str.end_with?(' ') && key == ' ') || (str.end_with?(' ') && key != "\c?")
  end

  def input_char
    key = $stdin.getch.chomp
    abort BYE if key == ':'
    input_char if IGNORE_NUMBERS.include?(key)
    key
  end

  def clear_stdin
    $stdin.getc while $stdin.ready?
  end

  def viewwords(str)
    return if str.size <= 1

    arr = ViewWords.new(str.downcase).res_str
    return if arr.empty?

    fst_col = arr.map { |_, v| v }.map(&:length).max
    snd_col = arr.map { |k, _| k }.map(&:length).max
    width = fst_col + snd_col + CUSTOM_WIDTH
    Table.new([width, 'Ru', 'Eng', arr])
  end
end
