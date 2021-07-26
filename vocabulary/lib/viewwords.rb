# frozen_string_literal: true

# class ViewWords
class ViewWords
  attr_reader :res_str                                                          # требуется для вовзврата результата в место вызова Vocabulary строка 52

  def initialize(str)                                                           # инициализация объекта введенным словом/фразой
    @res_str = []                                                               # иницаилизация пустого массива для результата запроса
    @res_str_ext = []                                                           # иницаилизация пустого массива для результата дополнительного запроса
    translation(str)
  end

  def translation(str)
    if str.end_with?(' ')                                                        # введен(передан) пробел после слова (или конец поиска, или будет следующее слово)
      space_after_word(str)
    else
      @res_str = searh_start_with(str).merge(searh_include(str)).uniq.sort.to_h  # выполняем запросы по началу и включения подстроки
      @res_str[RUNMF] = ENGNMF if @res_str.empty?                                # если результат пуст, вносим в результат(массив) дежурные фразы "ничего не найдено"
    end
  end

  def space_after_word(str)
    str = str.rstrip                                                              # удаляем пробел
    @res_str = search_accurate(str).sort.to_h                                     # поиск точного соотвествия
    @res_str_ext = searh_start_with(str).merge(searh_include(str)).uniq.sort.to_h # поиск по началу и включения подстроки
    if @res_str.empty? && !@res_str_ext.empty?                                    # если результат в точном нет, но в других поисках есть
      @res_str = @res_str_ext                                                     # переприсавиваем результат запроса, возвращаем что нашлось
    elsif @res_str.empty? && @res_str_ext.empty?                                  # иначе если оба запроса пусты
      @res_str[RUNMF] = ENGNMF                                                    # вносим в результат(массив) дежурные фразы "ничего не найдено"
    end
  end

  def search_accurate(str)
    LoadWords::ENGRU.select { |k, v| check_word?(k, str) || check_word?(v, str) }
  end

  def searh_start_with(str)
    LoadWords::ENGRU.select { |k, v| k.downcase.start_with?(str) || v.downcase.start_with?(str) }
  end

  def searh_include(str)
    LoadWords::ENGRU.select { |k, v| k.downcase.include?(str) || v.downcase.include?(str) }
  end

  def check_word?(value, str)
    case value
    when /,*\s\(/                                                                # если строка из файла содержит ',','пробел', 'скобку'
      value.split(/,*\s\(|\)/).any? { |word| word == str }                       # нарезаем на отдельные слова и/или выражения в скобках если таковые встретяться, далее сравниваем.
    when str                                                                     # если слово одно, сравниваем с введенным 
      true                                                                       # возвращаем 'true'
    end
  end
end
