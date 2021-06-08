require 'io/console'
require 'io/wait'

class CliMenu
  def initialize (array_menu, control_question, control_input)
    @array_menu = array_menu
    @control_question = control_question
    @control_input = control_input
  end
  def choice
    puts `clear`
    @array_menu.each do |row|
    puts row
    end
    #print @control_question
    
    
    fd = IO.sysopen("/dev/tty", "w")
    a = IO.new(fd,"w")
    #$stderr.puts "Hello"
    a.print @control_question
    #puts IO.console_size
    input = ''
    loop do
      #input = gets.strip
    
      #@control_input.each do |element|
        #puts input
       # unless input != element then 
      #      return input
       # end
        
      #end

      input = STDIN.getch
      
      input << STDIN.getch while STDIN.ready?       # Process multi-char paste
      #break if ["\r", "\n", "\r\n"].include?(input)
      break if @control_input.include?(input)
      STDOUT.print input
      
      
    end
    return input
    
  end
  def change(control_question)
  @control_question = control_question
  end

end