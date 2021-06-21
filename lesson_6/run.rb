require_relative 'lib/gym'
require_relative 'lib/user'
require_relative 'lib/settings'
require_relative 'lib/functions'
require_relative 'lib/messages'
require 'date'
require 'io/console'

user = User.new(auth)
user.show_menu
