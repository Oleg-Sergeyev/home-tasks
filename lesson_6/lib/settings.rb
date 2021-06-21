# frozen_string_literal: true

require 'csv'

DB_PATH = '../db'
PLAYERS_FULLPATH = 'db/players.csv'
PLAYERS_DB = CSV.read(PLAYERS_FULLPATH)
UNFVPLAYERS_FULLPATH = 'db/unvfplayers.csv'
VFPLAYERS_FULLPATH = 'db/vfplayers.csv'
DEFUALT_TIME = '22/06/2021 21:00'

GYM_1 = Gym.new('GYM №1', (Date.today..(Date.today + 2)), %w[09:00 17:00 21:00], 24, 12)
#GYM_2 = Gym.new('GYM №2', (Date.today..(Date.today + 2)), %w[08:00 15:00 18:00], 20, 10)
#GYM_3 = Gym.new('GYM №3', (Date.today..(Date.today + 2)), %w[12:00 16:00 18:00], 12, 6)
