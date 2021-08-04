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
    @text = gettext
  end

  def gettext
    arr_text = []
    rand(MIN..MAX_STRING).times do
      line_string = string
      return arr_text.join unless (line_string.bytesize + arr_text.join.bytesize) < text_size

      arr_text.push(line_string)
    end
    arr_text.join
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
end
