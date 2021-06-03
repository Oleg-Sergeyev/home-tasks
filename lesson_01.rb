require 'date'
# Первое задание
puts 'RUBY VERSION is ' + RUBY_VERSION

# Второе и третье задание

# Текущий год и текущая дата
current_year = Date.today.year
currnet_date = Date.today
# _current_month = (Date.today).month #_current_day = (Date.today).day

# Переменные учавствующие в функциях
year_birthday = ''
birthday_date = ''

# Массив для перевода названия месяца
RU_MONTHS = { 'Jan' => 'Января', 'Feb' => 'Февраля',
              'Mar' => 'Марта', 'Apr' => 'Апреля', 'May' => ' Мая', 'Jun' => 'Июня',
              'Jul' => 'Июля', 'Aug' => 'Августа', 'Sep' => ' Сентября', 'Nov' => 'Ноября',
              'Oct' => 'Октября', 'nov' => 'Ноября', 'Dec' => 'Декабря' }.freeze

# Функция замещения названия месяца "локализация"...
def eng_to_russian_date(date_string)
  date_string.gsub(/Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec/, RU_MONTHS)
end

puts 'Сегодня: ' + eng_to_russian_date(currnet_date.strftime('%d %b %Y'))
puts 'Привет, Олег!'

# Цикл ввода даты рождения
loop do
  print "Напиши дату рождения, в виде yyyy-mm-dd или 'q' для выхода: "
  birthday_date = gets.strip
  abort 'Пока, пока!' if birthday_date.to_s == 'q' # Если введено 'q' выход из программы
  # Получаем из введеной даты год, месяц, день
  year_birthday, _month_birthday, _day_birthday = birthday_date.split('-')
  # Пока дата невалидна продолжаем ввод
  break if Date.valid_date?(year_birthday.to_i, _month_birthday.to_i, _day_birthday.to_i)

  puts 'Дата некорректна!'
end
# Вычисление возраста
total_old =  current_year - year_birthday.to_i

# Формирование строки для вывода дня рождения в формате "хх ххххххх хххх"
str_birthday = eng_to_russian_date(Date.parse(birthday_date).strftime('%d %b %Y'))

# Функция вывода сообщения возраста в зависимости от последней цифры и др.
def chk_last_num_years_old(total_old, str_bd)
  if total_old.to_s[1].to_i < 5 && total_old.to_s[1].to_i >= 1
    puts 'Тебе: ' + total_old.to_s + ' года и твой день рождения ' + str_bd
  else puts 'Тебе: ' + total_old.to_s + ' лет и твой день рождения ' + str_bd
  end
end
chk_last_num_years_old(total_old, str_birthday)
