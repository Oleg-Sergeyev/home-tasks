require 'digest'
require 'date'
require 'io/console'
require 'csv'

class LocalUsersDb
  def initialize(local_path, file_name)
    @local_path = local_path
    @file_name = file_name
    @user_name = ''
    @psw_hash = ''
    @psw1 = ''
  end
  def create_user
    loop do
      puts `clear`
      print "Input new user name or 'q' for exit: "
      @user_name = gets.strip
      return unless !chk_manage_symbols('input_data', @user_name)
      break unless @user_name.length < 3 && @user_name.length < 10

      puts 'Name must have minimum 3 and maximum 10 symbols'
    end
    loop do
      puts `clear`
      @psw1 = IO.console.getpass "Create new password or 'q' for exit:  "
      return unless !chk_manage_symbols('input_data', @psw1)
      break if @psw1.length <= 10 && @psw1.length >= 6

      puts 'Name must have minimum 6 and maximum 10 symbols'
    end
    loop do
      puts `clear`
      psw2 = IO.console.getpass "Repeat password or 'q' for exit: "
      return unless !chk_manage_symbols('input_data', @psw2)
      break if @psw1 == psw2

      puts 'Password mismatch!'
    end
    @psw_hash = Digest::MD5.hexdigest @psw1
    puts `clear`
    print "Write new user 'y' - yes, 'n' - no ?"
    if chk_manage_symbols('write_file', gets.strip) == true
      puts show_current_user + ' saved'
      # abort 'Bye, bye!'
    end
    true
  end

  private

  def show_current_user
    _str = if @psw_hash == ''
             ' password is not set'
           else ' password hash: [' + @psw_hash + ']'
           end
    'User name: ' + "'" + @user_name + "'" + _str
  end

  def write_file
    _file = @local_path + '/' + @file_name
    _type_open = if !File.exist?(_file)
                   'w'
                 else
                   'a'
                 end
    CSV.open(_file, _type_open) do |csv|
      csv << [@user_name, @psw_hash, Date.today]
    end
  end

  def chk_manage_symbols(str1, str2)
    if str1 == 'write_file' && str2 == 'n' || str1 == 'input_data' && str2 == 'q'
      # abort 'Bye, bye!'
      return false
    end

    if str1 == 'write_file' && str2 == 'y'
      write_file
      true
    end
  end
end
