class LocalUser
  require 'digest'
  require 'date'
  require 'io/console'
  require 'csv'

  @user_name = ''
  @psw_hash = ''
  @psw1 = ''
  @local_path = ''
  @file_name = ''
  
  def create_user 
    loop do
      print "Create new user, please set user name or 'q' for exit: "
      @user_name = gets.strip
      chk_manage_symbols('input_data', @user_name)
      break if !(@user_name.length<3 && @user_name.length<10)
      puts 'Name must have minimum 3 and maximum 10 symbols'
    end
    loop do
      @psw1 = IO::console.getpass "Create new password: "
      chk_manage_symbols('input_data', @psw1)
      break if (@psw1.length <= 10 && @psw1.length >= 6)
      puts 'Name must have minimum 6 and maximum 10 symbols'
    end
    loop do
      psw2 = IO::console.getpass "Repeat password or 'q' for exit: "
      chk_manage_symbols('input_data', psw2)
      break if @psw1 == psw2
      puts 'Password mismatch!'
    end
    @psw_hash = Digest::MD5.hexdigest @psw1
    print "Write new user 'y' - yes, 'n' - no ?"
    if chk_manage_symbols('write_file', gets.strip) == true
    puts 'user ' + @user_name + ' saved'
    #abort 'Bye, bye!'
    end
    return true
  end
  private
  def show_user
    if @psw_hash == '' 
      _str = 'User password is not set'
      else _str = 'Password hash: ' + @psw_hash
    end
      puts 'User name: ' + @user_name + "\n" + _str
  end
  private
  def write_file
    @local_path = File.expand_path(File.dirname(__FILE__))
    @file_name = 'users.csv'
    _file = @local_path + '/' + @file_name
    if !File.exists?(_file)
      _type_open = "w"
    else 
      _type_open = "a"
    end
    CSV.open(_file, _type_open) do |csv|
      csv << [@user_name, @psw_hash, Date.today]
    end
  end
  private
  def chk_manage_symbols(str1, str2)
    if str1 == "write_file" && str2 == "n" || str1 == "input_data" && str2 == "q"
      abort 'Bye, bye!'
      return false
    end
    if str1 == "write_file" && str2 == "y"
      write_file()
      return true
    end
  end
end
