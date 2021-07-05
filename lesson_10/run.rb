# frozen_string_literal: true

require 'date'
require 'dotenv'

files = Dir.new("#{__dir__}/lib").children
files.each { |file| require_relative("lib/#{file}") }
clear

MainMenu.new('LESSON 10')
