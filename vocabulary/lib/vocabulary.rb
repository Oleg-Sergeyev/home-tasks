# frozen_string_literal: true

require 'io/console'
require 'io/wait'

# class Vocabulary
class Vocabulary
  def initialize
    start_input('')
  end

  def start_input(str_res)
    puts `clear`
    print "#{WELCOME} #{INFO}"
    clear_stdin
    get_str(str_res).downcase
  end

  def get_str(str)
    viewwords(str)
    print "#{INTERED_DATA} #{str}"
    key = input_char
    start_input(str) if check_input_key?(key, str)

    if key == "\c?"
      str = str[0...-1]
      start_input(str)
    end
    start_input("#{str}#{key}")
  end

  def check_input_key?(key, str)
    IGNORE_KEY.include?(key) || (str.end_with?(' ') && key == ' ')
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
    fst_col = arr.map { |_, v| v }.map(&:length).max
    snd_col = arr.map { |k, _| k }.map(&:length).max
    width = fst_col + snd_col + CUSTOM_WIDTH
    Table.new([width, 'Ru', 'Eng', arr])
  end
end
