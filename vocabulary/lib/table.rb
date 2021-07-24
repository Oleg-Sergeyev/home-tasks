# frozen_string_literal: true

# class Table
class Table
  attr_accessor :fst_col, :snd_col, :total_width, :fst_name, :snd_name, :data

  def initialize(arg)
    @fst_col, @snd_col, @fst_name, @snd_name, @data = *arg
    @total_width = @fst_col + @snd_col
    print_header
    print_table
  end

  def print_header
    print "\n"
    total_width.times { print '-' }
    print "\n|#{fst_col_name}"
    print center_header
    print snd_col_name
    print right_line_header
    print "\n"
    total_width.times { print '-' }
  end

  def fst_col_name
    format("%#{(total_width / 2) / 2}s", fst_name)
  end

  def snd_col_name
    format("%#{((total_width / 2) / 2) + 1}s", snd_name)
  end

  def center_header
    format("%#{(total_width / 2) - ((total_width / 2) / 2) + fst_name.length - 2}s", '|')
  end

  def right_line_header
    format("%#{total_width - (((total_width / 2) / 2) + (total_width / 2) - snd_name.length) - 5}s", '|')
  end

  def print_table
    data.each do |key, val|
      print "\n| #{val}"
      print center_line(val)
      print " #{key}#{right_side(key)}"
      print "\n"
      total_width.times { print '.' }
    end
  end

  def right_side(key)
    format("%#{total_width - (total_width / 2 + key.length) - 2}s", '|')
  end

  def center_line(val)
    format("%#{((total_width / 2) - 1) - val.length}s", '|')
  end
end
