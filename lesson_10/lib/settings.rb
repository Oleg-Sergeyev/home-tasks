# frozen_string_literal: true

# Messages
INPUT_ERROR = 'Input error!'
THANKS = "\n\nThanks! Bye!"
INTERED_DATA = "\nYou entered this data:"
MESSAGE_PRESS_KEY = "\n\n\nPress 'q' exit, 'n' next, 'b' back, 'r' reload, '1..9' manual select task "
MESSAGE_PRESS_ACCEPT = "\n\n\nPress 'a' to accept or 'i' input again"
# Arrays of control characters
SYMBOLS_MENU2 = { 'n' => :next, 'b' => :back, 'q' => :quit, 'r' => :restart }.freeze
SYMBOLS_MENU1 = { 'a' => :accept, 'i' => :input }.freeze
# TASKS
TASK1_DESCRIPTION = 'Задание №1. Деление двух чтсел'
INPUTS1 = ["\nInput dividend like '654': ", "\nInput divider '3': "].freeze
TASK1 = [TASK1_DESCRIPTION, INPUTS1, 1].freeze

TASK2_DESCRIPTION = 'Задание №2. Массив определенного размера состоящий из случайный числе от 0..99'
INPUTS2 = ["\nInput array size: "].freeze
TASK2 = [TASK2_DESCRIPTION, INPUTS2, 2].freeze

TASK3_DESCRIPTION = 'Задание №3. Список пользователей в алфавитном порядке'
INPUTS3 = ["\nInput some surnames like 'Казанцев Антропов...': "].freeze
TASK3 = [TASK3_DESCRIPTION, INPUTS3, 3].freeze
TASK3_DATA = 'Иванов,Петров,Сидоров,Алексеева,Казанцев,Антропов,Анисимова,Кузнецов,Соловьёв,Кошкина'

TASKS = [TASK1, TASK2, TASK3].freeze

# Arrays of control characters
NUMBERS_MENU2 = (1..TASKS.size).freeze
