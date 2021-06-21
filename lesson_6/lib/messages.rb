# frozen_string_literal: true

MENU1_PLAYER = {
  "\n View Gyms schedule (press 1)" => 1,
  ' Sign up for training (press 2)' => 2,
  ' Press any other key to exit' => ''
}.freeze
MENU1_TRAINER = {
  "\n View unverified players list (press 1)" => 1,
  ' Autocheck players list (press 2)' => 2,
  ' Manual edit players list (press 3)' => 3,
  ' View verified players list (press 4)' => 4,
  ' Send to GYM verified players list (press 5)' => 5,
  ' Press any other key to exit' => ''
}.freeze
SELECT_MENU = "\nSelect one of the menu items. This is menu for "
YOUR_CHOICE = "\nYour choice: "
BACK_KEY = "\nPress 'b' to back: "
SIGNUP_TIME = "\nInput date and time '22/06/2021 21:00'or press Enter for default this time: "
DATE_IS_NOT_CORRECT = 'The entered date is not correct'
PRESS_ANY_KEY = "Press any key to enter date or 'b' to back "
PRESS_ANY_KEY_TO_EXIT = "Press any key to exit or 'b' to back main menu "
YOU_APPLIED = 'You applied'
BYE = "\nBye, bye!"
HEADER_TABLE = '| № |    Start date    |  Surname  |    Name    |  Application date'
HEADER_TABLE_VFPLAYERS = '| № |    Start date    |  Surname  |    Name    |'
VFPLAYERS_CREATED = 'Verified players list was created'
MESSAGE_PRESS_ANY_KEY = "Press any key to continue, or 'q' to exit"
INPUT_LOGIN = "\nInput login: "
DESCRIPTION = "\nНеобходимо авторизоваться либо тренером, либо игроком."\
     "\nВ файле player.csv список всех игроков и одного тренера."\
     "\nАвторизация по логину и паролю у всех '123'."\
     "\nИгрок может посмотреть 'пункт 1' текущие даты и время для записи"\
     "\nИгрок может записаться введя двту и время 'пункт 2'"\
     "\nТренер может просмотреть список заявленных игроков 'пункт 1'"\
     "\nТренер может 'автоматом' создать список подтвержденных игроков,"\
     "\nте которые попадают на доступное время тренировок, ограниченное временным"\
     "\nрежимом спортзала, это 'пункт 2'."\
     "\nТренер может посмотреть то как программа отобрала игроков по времени"\
     "\nтренировок это 'пункт 4'. Пункты 3, 5 не реализованны"
