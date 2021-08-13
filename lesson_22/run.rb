# frozen_string_literal: true

require 'find'

Find.find('/home/oleg') { |file| puts file }
