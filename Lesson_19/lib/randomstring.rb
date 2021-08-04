# frozen_string_literal: true

# class RandomString
class RandomString
  attr_accessor :size

  def initialize(text_size)
    @text_size = text_size
    @line
    chk_size
  end

  def chk_size
    while size <= text_size
      word = random_word
      return if word.bytesize > text_size

      string = random_string(word)
      text(string)

      end
    end
  end

  def self.text(string)
    arr = []
    # rand(1..200).times { arr.push(random_string) }
    # arr.join("\n")
    @text.push(string << "\n")
    @line << str if (str.bytesize + @line.bytesize) < text_size
    @line
  end

  def self.random_string(word)
    arr = []
    # rand(2..20).times { arr.push(random_word) }
    # arr.join(', ')
    str = " #{arr.push(word).join(' ')}"
    @line << str if (str.bytesize + @line.bytesize) < text_size
    @line
  end

  def self.random_word
    ('0'..'z').to_a.sample(rand(1..10)).join
  end
end
