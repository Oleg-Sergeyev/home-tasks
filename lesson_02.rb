class LocalUser
  user_name = ''
  psw_hash = ''
  psw1 = ''
  def create_local_user 

    loop do
      print "Create new user, please set user name or 'q' for exit: "
      user_name = gets.strip
      chk_exit_prog(user_name)
      break if !(user_name.length<3 && user_name.length<10)
        puts 'Name must have minimum 3 and maximum 10 symbols'
    end
    
    loop do
      print "Create new password, minimum 6 and maximum 10 symbols or 'q' for exit: "
      psw1 = gets.strip
      chk_exit_prog(psw1)
      break if !(psw1.length<3 && psw1.length<10)
      puts 'Name must have minimum 6 and maximum 10 symbols'
    end

    loop do
      print "Repeat password or 'q' for exit: "
      psw2 = gets.strip
      chk_exit_prog(psw2)
      break if !psw1 == psw2
      puts 'Password mismatch!'
    end
    psw_hash = psw1.md5

 

    #  def show_user
    #    if psw_hash == '' _str = 'User password is not set'
    #      else _str = 'User password: ' + psw_hash
    #    end
    #    'User name: ' + user_name + "\n" + 
    #    'User role: ' + user_role + "\n" +
    #    _str
    #  end
  end
  def chk_exit_prog(str)
    if str == "q" # Если введено 'q' выход из программы
      abort 'Bye, bye!'
    end
  end
end

user1 = LocalUser.new
user1.create_local_user
