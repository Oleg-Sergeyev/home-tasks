# frozen_string_literal: true
require 'csv'
require_relative 'settings'
require_relative 'gym'

# Class Trainer
class Trainer
  def initialize

  end

  def unverified_players
    @arr_players = CSV.read(UNFVPLAYERS_FULLPATH)
  end
end
