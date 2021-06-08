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
    print @control_question
    loop do
      input = gets.strip
      #puts input
      @control_input.each do |element|
        #puts input
        unless input != element then 
            return input
        end
      end
    end
    
  end
end