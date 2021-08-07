# frozen_string_literal: true

# class RandomText
class RandomText
  attr_accessor :text_size, :text

  MIN = 1
  MIN_BYTES = 50
  MAX_CHARS = 12
  MAX_WORDS = 25
  LS = ".\r\n"
  def initialize(text_size)
    @text_size = text_size
    @arr_text = []
    @text = gettext
  end

  def gettext
    line_string = string
    if (line_string.bytesize + @arr_text.join.bytesize) < text_size
      @arr_text.push(line_string)
      first_correct_array
    else
      correct_array
    end
  end

  def first_correct_array
    if (text_size - @arr_text.join.bytesize) > MIN_BYTES
      gettext
    else
      correct_array
    end
  end

  def correct_array
    accurate(text_size - @arr_text.join.bytesize)
  end

  def string
    arr_string = []
    rand(MIN..MAX_WORDS).times do
      word = ('0'..'z').to_a.sample(rand(MIN..MAX_CHARS)).join
      check_string_size(arr_string, word)
    end
    arr_string[-1] = arr_string.last.rstrip if arr_string[-1]
    arr_string.push(LS).join
  end

  def check_string_size(arr_string, word)
    if (arr_string.join.bytesize + word.bytesize + LS.bytesize) < text_size
      arr_string.push("#{word} ")
    else
      arr_string.push(LS).join
    end
    arr_string
  end

  def accurate(bytes)
    str = string
    if (bytes - str.size).zero?
      @arr_text.push(str).join
    else
      begin
        accurate(bytes)
      rescue StandardError
        @arr_text.join
      end
    end
  end
end
