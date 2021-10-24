# frozen_string_literal: true

require_relative 'lib/functions'
require_relative 'lib/homework'
require_relative 'lib/menuitem'
require_relative 'lib/taskmanager'
require_relative 'lib/user'
require 'date'

clear
lesson = getlessons[getlessons.size - 1]
TaskManager.new(lesson) # Start new tasks
