# frozen_string_literal: true

# class UserException
class UserException < RuntimeError
end

# class User
class User
  attr_accessor :mail

  WARNINGS = { nick_name: 'The nickname does not match..',
               mail: 'The mail does not match..' }.freeze
  def initialize(nick_name, mail)
    raise UserException, WARNINGS[:mail] unless mail.match(/[^@ \t\r\n]+@[^@ \t\r\n]+\.[^@ \t\r\n]+/)

    raise UserException, WARNINGS[:nick_name] unless nick_name.match(/[A-Z, a-z, 0-9, @_,.\-]/)

    @nick_name = nick_name
    @mail = mail
  end
end

p User.new('Den_454@ssK', 'some-mail@gmail.com')
User.new('Арсений', 'arseny@mail.ru')
User.new('Arseny21', 'kkdfkjIj274@kjk')
