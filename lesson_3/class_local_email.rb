require 'rubygems'
require 'net/smtp'
# class LocalEmail
class LocalEmail
  def initialize(from, to, theme)
    @from = from
    @to = to
    @theme = theme
  end

  def message(text)
    @text = text
    message << "From: ot kogo <#{@from}>\n"
    message << "To: #{@to}\n"
    message << "Subject: #{@theme}\n"
    message << @text
  end

  def send
    Net::SMTP.new('localhost', 25).start('example.com') do |smtp|
      smtp.send_message @message, @from, @to
    end
  end
end
