# frozen_string_literal: true

INPUT_ERROR = 'Input error!'
THANKS = "\n\nThanks! Bye!"
MESSAGE_PRESS_KEY = "\n\nPress 'q'- exit, 'n' - next, 'b' - back, 'r' restart task"
MESSAGE_PRESS_ACCEPT = "\n\nPress 'a' to accept or 'i' input again"
SYMBOLS_MENU2 = { 'n' => :next, 'b' => :back, 'q' => :quit, 'r' => :restart }.freeze
SYMBOLS_MENU1 = { 'a' => :accept, 'i' => :input }.freeze

TASK1_DESCRIPTION = "\nЗадание №1. В этом задании нужно ввести три параметра"
INPUTS1 = ["\nInput first param like '654': ", "\nInput second param: ", "\nInput third param: "].freeze
TASK1 = [TASK1_DESCRIPTION, INPUTS1, 1].freeze

TASK2_DESCRIPTION = "\nЗадание №2. В этом задании достаточно одного параметра"
INPUTS2 = ["\nInput only one param: "].freeze
TASK2 = [TASK2_DESCRIPTION, INPUTS2, 2].freeze

TASKS = [TASK1, TASK2].freeze
