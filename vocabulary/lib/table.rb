# frozen_string_literal: true

# class Table
class Table
  attr_accessor :width, :middle_table, :middle_column, :total_width, :fst_name, :snd_name, :data

  def initialize(arg)
    @width, @fst_name, @snd_name, @data = *arg
    @middle_table = @width / 2
    @middle_column = @middle_table / 2
    print_header
    print_table
  end

  def print_header
    print "\n\n"
    width.times { print '=' }
    print "\n|#{fst_col_name}"
    print center_header
    print snd_col_name
    print right_line_header
    print "\n"
    width.times { print '=' }
  end

  def fst_col_name
    format("%#{middle_column}s", fst_name)
  end

  def snd_col_name
    format("%#{middle_column + 1}s", snd_name)
  end

  def center_header
    format("%#{middle_table - middle_column + fst_name.length - 2}s", '|')
  end

  def right_line_header
    format("%#{width - (middle_column + middle_table - snd_name.length) - 5}s", '|')
  end

  def print_table
    data.each do |key, val|
      print "\n| #{val}"
      print center_line(val)
      print " #{key}#{right_side(key)}"
      print "\n"
      width.times { print '.' }
    end
  end

  def right_side(key)
    format("%#{width - (middle_table + key.length) - 2}s", '|')
  end

  def center_line(val)
    format("%#{(middle_table - 1) - val.length}s", '|')
  end
end
