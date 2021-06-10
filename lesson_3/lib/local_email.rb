require 'rubygems'
require 'net/smtp'
require 'dotenv'
Dotenv.load

# class LocalEmail
class LocalEmail
  def initialize(from, to, theme)
    @from = from
    @to = to
    @theme = theme
    @message = ''
  end

  attr_reader :from, :to, :theme

  def message(text)
    @message << "From: <#{@from}>\n"
    @message << "To: #{@to}\n"
    @message << "Subject: #{@theme}\n"
    @message << text
  end

  def send
    # puts @message
    Net::SMTP.start(ENV['SMTP'], 587, ENV['DOMAIN'], ENV['EMAIL'], ENV['PASSPORT'], :plain) do |smtp|
      smtp.send_message @message, from, to
    end
  end
end
