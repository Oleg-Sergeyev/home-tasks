# frozen_string_literal: true

require 'date'

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

# TASKS
TASK1_DESCRIPTION = 'Задание №1. Деление двух чисел'
INPUTS1 = ["\nInput dividend like '654': ", "\nInput divider '3': "].freeze
TASK1 = [TASK1_DESCRIPTION, INPUTS1, 1].freeze

TASK2_DESCRIPTION = 'Задание №2. Массив определенного размера состоящий из случайный числе от 0..99'
INPUTS2 = ["\nInput array size: "].freeze
TASK2 = [TASK2_DESCRIPTION, INPUTS2, 2].freeze

TASK3_DESCRIPTION = 'Задание №3. Список пользователей в алфавитном порядке'
SURNAMES = ['Иванов Петров Сидоров Алексеева Казанцев Антропов Анисимова Кузнецов Соловьёв Кошкина'].freeze
INPUTS3 = ["\nInput some surnames like 'Казанцев Антропов...' or press enter to get it: ", SURNAMES].freeze
TASK3 = [TASK3_DESCRIPTION, INPUTS3, 3].freeze

TASK4_DESCRIPTION = 'Задание №4. Вывод интервала дней текущей недели'
INPUTS4 = ["\nInput any date like '28-08-2021' or press enter to '#{TODAY}' : ", [TODAY]].freeze
TASK4 = [TASK4_DESCRIPTION, INPUTS4, 4].freeze

TASKS = [TASK1, TASK2, TASK3, TASK4].freeze

# Arrays of control characters
NUMBERS_MENU2 = (1..TASKS.size).freeze
# Messages
MESSAGE_PRESS_KEY = "\n\nPress 'q' exit to main menu, 'r' restart this task"
MESSAGE_MAINMENU_PRESS_KEY = "\n\nPress 'q' exit or '1..#{TASKS.size}' select task "
