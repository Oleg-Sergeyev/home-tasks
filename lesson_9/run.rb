# frozen_string_literal: true

require_relative 'lib/functions'
require_relative 'lib/homework'
require_relative 'lib/menuitem'
require_relative 'lib/menumanage'
require_relative 'lib/user'
require 'date'

clear
lesson = getlessons[getlessons.length - 1]
MenuManage.new(lesson) # Start new tasks
