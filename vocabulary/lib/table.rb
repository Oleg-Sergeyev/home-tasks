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
    print "\n|#{fst_col_name}#{center_header}#{snd_col_name}#{right_line_header}"
    print "\n"
    total_width.times { print '-' }
    print "\n"
  end

  def fst_col_name
    format("%#{fst_col / 2}s", fst_name)
  end

  def snd_col_name
    format("%#{snd_col / 2}s", snd_name)
  end

  def center_header
    format("%#{(total_width / 2) - (fst_col / 2)}s", '|')
  end

  def right_line_header
    format("%#{total_width - (fst_col + (snd_col / 2)) - 1}s", '|')
  end

  def print_table
    data.each { |key, val| puts "| #{left_side(val, key, fst_col)}#{right_side(key, snd_col)}" }
  end

  def left_side(val, key, max_size_v)
    "#{val} #{format("% #{max_size_v}s", "| #{key}")}"
  end

  def right_side(key, max_size_k)
    format("% #{max_size_k - 2 - key.length}s", '|')
  end
end
