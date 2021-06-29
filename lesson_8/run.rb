# frozen_string_literal: true

require_relative 'lib/myobject'
require_relative 'lib/qualifier'
require_relative 'lib/functions'
require_relative 'lib/homework'
require_relative 'lib/menuitem'

clear
descr = "\nЗадания №1. Цвет по номеру"
input = "\nInput color number (1-7): "
MenuItem.new(descr, input, :task1)

clear
descr = "\nЗадания №2. День недели по номеру"
input = "\nInput day number (1-7): "
MenuItem.new(descr, input, :task2)

clear
descr = "\nЗадания №3. Проверка на целостность чисел и максимум из них"
input = "\nEnter different numbers like '1 59 77 10 3' and you can even check strings: "
MenuItem.new(descr, input, :task3)

clear
descr = "\nЗадания №4,5,6. Что введнено? Если число то тип, положительное/отрицательное?"
input = "\nEnter something: "
MenuItem.new(descr, input, :task4)
