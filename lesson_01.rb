# frozen_string_literal: true

require 'date'
# Первое задание
puts "RUBY VERSION is #{RUBY_VERSION}"

# Второе и третье задание
_current_year = Date.today.year
_current_month = Date.today.month
_current_day = Date.today.day
_currnet_date = Date.today
# Переменные для проверки на валидность по календарю
_year_birthday = ''
_month_birthday = ''
_day_birthday = ''
_birthday_date = ''

# Массив для перевода названия месяца
RU_MONTHS = { 'Jan' => 'Января', 'Feb' => 'Февраля',
              'Mar' => 'Марта', 'Apr' => 'Апреля', 'May' => 'Мая', 'Jun' => 'Июня',
              'Jul' => 'Июля', 'Aug' => 'Августа', 'Sep' => 'Сентября', 'Nov' => 'Ноября',
              'Oct' => 'Октября', 'nov' => 'Ноября', 'Dec' => 'Декабря' }.freeze
RU_MONTHS.freeze
# Функция замещения названия месяца "локализация"...
def eng_to_russian_date(date_string)
  date_string.gsub(/Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec/, RU_MONTHS)
end

puts "Сегодня: #{eng_to_russian_date(_currnet_date.strftime('%d %b %Y'))}"
puts 'Привет, Олег!'

# Цикл ввода даты рождения
loop do
  print "Напиши дату рождения, в виде yyyy-mm-dd или 'q' для выхода: "
  _birthday_date = gets.strip
  abort 'Пока, пока!' if _birthday_date.to_s == 'q' # Если введено 'q' выход из программы
  _year_birthday = (_birthday_date[0, 4]).to_i
  _month_birthday = (_birthday_date[5, 7]).to_i
  _day_birthday = (_birthday_date[8, 9]).to_i
  # Пока дата невалидна продолжаем ввод
  break if Date.valid_date?(_year_birthday, _month_birthday, _day_birthday)

  puts 'Дата некорректна!'
end
# Вычисление возраста
_total_old =  _current_year - _year_birthday

# Формирование строки для вывода дня рождения в формате "хх ххххххх хххх"
_str_birthday = eng_to_russian_date(Date.parse(_birthday_date).strftime('%d %b %Y'))

# Функция вывода сообщения возраста в зависимости от последней цифры и др.
def chk_last_num_years_old(total_old, str_birthday)
  if total_old.to_s[1].to_i < 5 && total_old.to_s[1].to_i >= 1
    puts "Тебе: #{total_old} года и твой день рождения #{str_birthday}"
  else puts "Тебе: #{total_old} лет и твой день рождения #{str_birthday}"
  end
end
chk_last_num_years_old(_total_old, _str_birthday)
