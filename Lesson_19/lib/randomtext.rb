# frozen_string_literal: true

# class RandomText
class RandomText
  attr_accessor :text_size, :text

  MIN = 1
  MAX_CHARS = 12
  MAX_WORDS = 25
  MAX_STRING = 25
  LS = ".\r\n"
  def initialize(text_size)
    @text_size = text_size
    @arr_text = []
    @text = gettext
    
  end

  def gettext
    rand(MIN..MAX_STRING).times do
      line_string = string
      return @arr_text.join unless (line_string.bytesize + @arr_text.join.bytesize) < text_size

      @arr_text.push(line_string)
      #puts "DEBUG1_before: #{text_size - @arr_text.join.bytesize}"
    end
    #puts text_size / 10
    if (text_size - @arr_text.join.bytesize) > 100
      puts "DEBUG_before: #{text_size - @arr_text.join.bytesize}"
      gettext
      puts "DEBUG_after: #{text_size - @arr_text.join.bytesize}"
    else
     # @arr_text.join
      accurate(text_size - @arr_text.join.bytesize)
    end
    #accurate(text_size - @arr_text.join.bytesize)
  end

  def string
    arr = []
    rand(MIN..MAX_WORDS).times do
      word = ('0'..'z').to_a.sample(rand(MIN..MAX_CHARS)).join
      return arr.push(LS).join unless (arr.join.bytesize + word.bytesize + LS.bytesize) < text_size

      arr.push("#{word} ")
    end
    arr[-1] = arr.last.rstrip
    arr.push(LS).join
  end

  def accurate(bytes)
    puts "HERE!!!"
    str = string
    if (bytes - str.size).zero?
      @arr_text.push(str).join
    else
      accurate(bytes)
    end
  end
end
