# frozen_string_literal: true

def clear
  puts `clear`
end

def empty_string?(str)
  return true if str.count(' ') == str.length
end

def first_space?(str)
  return true if str[0] == ' '
end

def empty?(str)
  return true if str == ''
end

def not_empty?(str)
  return true if str != ''
end
