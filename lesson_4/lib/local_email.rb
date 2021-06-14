require 'rubygems'
require 'dotenv'
require 'pony'
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

  def message_(text)
    @message << "From: <#{@from}>\n"
    @message << "To: #{@to}\n"
    @message << "Subject: #{@theme}\n"
    @message << text
  end

  def send_mail(text, attachment = false, filename = false)
    Pony.mail({
                from: from,
                to: to,
                via: :smtp,
                body: text,
                subject: theme,
                html_body: text,
                attachments: { filename => attachment },
                via_options: {
                  address: ENV['SMTP'],
                  port: 587,
                  enable_starttls_auto: true,
                  openssl_verify_mode: 'none',
                  user_name: ENV['EMAIL'],
                  password: ENV['PASSPORT'],
                  authentication: :login, # :plain, :login, :cram_md5, no auth by default
                  domain: ENV['DOMAIN'] # the HELO domain provided by the client to the server
                }
              })
  end
end
