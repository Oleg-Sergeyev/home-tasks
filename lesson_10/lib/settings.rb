# frozen_string_literal: true

# Messages
INPUT_ERROR = 'Input error!'
THANKS = "\n\nThanks! Bye!"
INTERED_DATA = "\nYou entered this data:"
MESSAGE_PRESS_KEY = "\n\nPress 'q' exit, 'n' next, 'b' back, 'r' reload, '1..9' manual select task "
MESSAGE_PRESS_ACCEPT = "\n\nPress 'a' to accept or 'i' input again"
# Arrays of control characters
SYMBOLS_MENU2 = { 'n' => :next, 'b' => :back, 'q' => :quit, 'r' => :restart }.freeze
SYMBOLS_MENU1 = { 'a' => :accept, 'i' => :input }.freeze
# TASKS
TASK1_DESCRIPTION = 'Задание №1. В этом задании нужно ввести три параметра'
INPUTS1 = ["\nInput first param like '654': ", "\nInput second param like 'Qwerty': ",
           "\nInput third param '@3{}o!jd': "].freeze
TASK1 = [TASK1_DESCRIPTION, INPUTS1, 1].freeze

TASK2_DESCRIPTION = 'Задание №2. В этом задании достаточно одного параметра'
INPUTS2 = ["\nInput only one param like '03/02/2018': "].freeze
TASK2 = [TASK2_DESCRIPTION, INPUTS2, 2].freeze

TASKS = [TASK1, TASK2].freeze

# Arrays of control characters
NUMBERS_MENU2 = (1..TASKS.size).freeze
