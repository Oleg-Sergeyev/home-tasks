# frozen_string_literal: true

require_relative 'lib/inputword'

str = 'Welcome to new vocabluary!'
loop do
  str = InputWord.new(str).getstr
end
