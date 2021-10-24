# frozen_string_literal: true

require_relative 'lib/const'
require_relative 'lib/vocabulary'
require_relative 'lib/loadwords'
require_relative 'lib/viewwords'
require_relative 'lib/table'

LoadWords.new("#{__dir__}/data/engrus.csv")
Vocabulary.new
