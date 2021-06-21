# frozen_string_literal: true

require_relative 'settings'
require 'digest'
require 'io/console'
require 'io/wait'
require 'date'
require 'csv'
require 'fileutils'

def chk(user)
  PLAYERS_DB.find { |row| row[1] == user[0] && row[2] == Digest::MD5.hexdigest(user[1]).upcase }
end

def userid(id)
  (PLAYERS_DB.find { |row| row[0] == id.to_s })[3..4].join('     ')
end

def auth
  user = []
  loop do
    puts `clear`
    print 'Input your login: '
    login = gets.strip
    pass = IO.console.getpass 'Input your password: '
    user = chk(Array[login, pass])
    break unless user.nil?
  end
  Array[user[0], user[1], user[3], user[4], user[5]]
end

def savesignup(time)
  type_open = if !File.exist?(UNFVPLAYERS_FULLPATH)
                'w'
              else
                'a'
              end
  CSV.open(UNFVPLAYERS_FULLPATH, type_open) do |csv|
    csv << [DateTime.parse(time), @id, DateTime.now] # Date.today.strftime('%FT%T%:z')]
  end
end

def clear
  puts `clear`
end

def veiwgym(gym)
  puts gym.name
  gym.arr_date.each do |day|
    puts "\n#{day}"
    gym.arr_time.each do |time|
      puts time
    end
  end
end

# For trainer function

def viewunverifiedplayers
  clear
  unvfplayers = CSV.read(UNFVPLAYERS_FULLPATH)
  puts HEADER_TABLE
  i = 1
  unvfplayers.each do |element|
    print "\n  #{i}   #{DateTime.parse(element[0]).strftime('%m-%d-%Y %H:%M')}     "\
    "#{userid(element[1])}   #{DateTime.parse(element[2]).strftime('%m-%d-%Y %H:%M')}"
    i += 1
  end
end

# For trainer function

def viewverifiedplayers
  clear
  vfplayers = CSV.read(VFPLAYERS_FULLPATH)
  puts HEADER_TABLE_VFPLAYERS
  i = 1
  vfplayers.each do |element|
    print "\n  #{i}   #{DateTime.parse(element[0]).strftime('%m-%d-%Y %H:%M')}     "\
    "#{userid(element[1])}"
    i += 1
  end
end

# For trainer function

def checkunverifiedplayers
  arr1 = []
  arr2 = []
  unvfplayers = CSV.read(UNFVPLAYERS_FULLPATH)
  GYM_1.arr_date.each do |date|
    unvfplayers.each do |element|
      arr1.push(element) if DateTime.parse(element[0]).strftime('%Y-%m-%d') == (date).strftime('%Y-%m-%d')
    end
  end
  GYM_1.arr_time.each do |time|
    arr1.each do |element|
      arr2.push(element) if DateTime.parse(element[0]).strftime('%H:%M') == DateTime.parse(time).strftime('%H:%M')
    end
  end
  return arr2 if arr2.size <= GYM_1.maxplayers
end

# For trainer function

def write_verifiedplayers(arr)
  FileUtils.remove_file VFPLAYERS_FULLPATH, force: true if File.exist?(VFPLAYERS_FULLPATH)
  CSV.open(VFPLAYERS_FULLPATH, 'w') do |csv|
    arr.each do |row|
      csv << [row[0], row[1]]
    end
  end
end
