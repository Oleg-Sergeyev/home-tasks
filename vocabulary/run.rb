# frozen_string_literal: true

require_relative 'lib/const'
require_relative 'lib/inputchar'
require_relative 'lib/loadwords'
require_relative 'lib/viewwords'
require_relative 'lib/table'

str = ''
filename = "#{__dir__}/data/engrus.csv"
LoadWords.new(filename)
loop do
  str = InputChar.new(str).getstr
end
