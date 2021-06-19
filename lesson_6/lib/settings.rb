# frozen_string_literal: true

require 'csv'

DB_PATH = '../db'
PLAYERS_FULLPATH = 'db/players.csv'
PLAYERS_DB = CSV.read(PLAYERS_FULLPATH)
UNFVPLAYERS_FULLPATH = 'db/unvfplayers.csv'

GYM_1 = Gym.new((Date.today..(Date.today + 5)), %w[9-00 17-00 20-00], 24, 12)
GYM_2 = Gym.new((Date.today..(Date.today + 5)), %w[8-00 15-00 18-00], 20, 10)
GYM_3 = Gym.new((Date.today..(Date.today + 5)), %w[12-00 16-00 18-00], 12, 6)
