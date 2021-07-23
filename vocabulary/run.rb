# frozen_string_literal: true

require_relative 'lib/inputchar'
require_relative 'lib/loadwords'
require_relative 'lib/viewwords'

str = 'Welcome to new vocabluary!'
loop do
  str = InputChar.new(str).getstr
end
