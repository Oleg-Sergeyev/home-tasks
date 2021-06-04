class LocalUser
  require 'digest'
  require 'io/console'

  @user_name = ''
  @psw_hash = ''
  @psw1 = ''
  
  def create_user 
    loop do
      print "Create new user, please set user name or 'q' for exit: "
      @user_name = gets.strip
      chk_exit_prog(@user_name)
      break if !(@user_name.length<3 && @user_name.length<10)
      puts 'Name must have minimum 3 and maximum 10 symbols'
    end
    loop do
      @psw1 = IO::console.getpass "Create new password: "
      chk_exit_prog(@psw1)
      break if (@psw1.length <= 10 && @psw1.length >= 6)
      puts 'Name must have minimum 6 and maximum 10 symbols'
    end
    loop do
      psw2 = IO::console.getpass "Repeat password or 'q' for exit: "
      chk_exit_prog(psw2)
      break if @psw1 == psw2
      puts 'Password mismatch!'
    end
    @psw_hash = Digest::MD5.hexdigest @psw1
    #puts @psw_hash
  end
  def chk_exit_prog(str)
    if str == "q" # Если введено 'q' выход из программы
      abort 'Bye, bye!'
    end
  end
  def show_user
    if @psw_hash == '' 
      _str = 'User password is not set'
      else _str = 'Password hash: ' + @psw_hash
    end
      puts 'User name: ' + @user_name + "\n" + _str
  end
end
