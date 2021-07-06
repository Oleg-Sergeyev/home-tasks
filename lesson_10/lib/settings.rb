# frozen_string_literal: true

require_relative 'database'
require 'date'

TASKS = DataBase.new(10).tasks
# Messages
INPUT_ERROR = 'Input error!'
THANKS = "\n\nThanks! Bye!"
INTERED_DATA = "\nYou entered this data:"
MESSAGE_PRESS_ACCEPT = "\n\n\nPress 'a' to accept or 'i' input again"
TODAY = Date.today.strftime('%d-%m-%Y')
DATE_ERROR = "\nSorry, it is impossible to get the days of the week for this date!"
# Arrays of control characters
SYMBOLS_MENU2 = { 'q' => :quit, 'r' => :restart }.freeze
SYMBOLS_MENU1 = { 'a' => :accept, 'i' => :input }.freeze

# Arrays of control characters
NUMBERS_MENU2 = (1..TASKS.size).freeze
# Messages
MESSAGE_PRESS_KEY = "\n\nPress 'q' exit to main menu, 'r' restart this task"
MESSAGE_MAINMENU_PRESS_KEY = "\n\nPress 'q' exit or '1..#{TASKS.size}' select task "
