require 'rubygems'
require 'net/smtp'
# class LocalEmail
class LocalEmail
  def initialize(from, to, theme)
    @from = from
    @to = to
    @theme = theme
    @message = ''
  end

  def message(text)
    @text = text
    @message << "From: <#{@from}>\n"
    @message << "To: #{@to}\n"
    @message << "Subject: #{@theme}\n"
    @message << @text
  end

  def send
    puts @message
    Net::SMTP.new('smtp.******', 465).start('******', '******', '*******') do |smtp|
      smtp.send_message @message, @from, @to
    end
  end
end
