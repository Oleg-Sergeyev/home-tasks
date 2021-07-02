# frozen_string_literal: true

# Class MultiInput
class MultiInput
  attr_accessor :getstr

  def initialize(str_res, description, input_str)
    clear
    puts description
    print "\nTotal entered: #{str_res}"
    @getstr = input_str(input_str) if input_str != ''
  end

  def input_str(str)
    print "\n#{str}"
    gets.chomp
  end
end
