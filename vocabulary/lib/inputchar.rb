# frozen_string_literal: true

require 'io/console'
require 'io/wait'

# class InputChar
class InputChar
  attr_accessor :getstr

  def initialize(str_res)
    puts `clear`
    print WELCOME
    print INFO
    clear_stdin
    @getstr = input_str(str_res).downcase
  end

  def input_str(str)
    viewwords(str)
    print "#{INTERED_DATA} #{str}"
    key = $stdin.getch.chomp
    abort BYE if key == ':'
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

  def clear_stdin
    $stdin.getc while $stdin.ready?
  end

  def viewwords(str)
    return if str.size <= 1

    arr = ViewWords.new(str).res_str
    return if arr.empty?

    fst_col = arr.map { |_, v| v }.map(&:length).max
    snd_col = arr.map { |k, _| k }.map(&:length).max
    width = fst_col + snd_col + 20
    Table.new([width, 'Ru', 'Eng', arr])
  end
end
