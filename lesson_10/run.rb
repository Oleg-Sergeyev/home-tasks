# frozen_string_literal: true

require_relative 'lib/settings'
require_relative 'lib/homework'
require_relative 'lib/menuitem'
require_relative 'lib/multiinput'
require_relative 'lib/taskmanager'
require 'date'

clear
TaskManager.new(1) # Start new tasks
