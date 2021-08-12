# frozen_string_literal: true

require 'singleton'
require 'find'
require_relative 'human_size'

# class Scan
class Scan
  include Singleton

  def self.path_size(path)
    size = Find.find(path).reduce(0) { |s, f| s + File.size(f) }
    Dimensions.human_size { |val| val.calc(size) }
  end
end
