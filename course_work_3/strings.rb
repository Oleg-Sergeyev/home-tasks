# frozen_string_literal: true

require 'fileutils'
require_relative 'lib/strings_git_repo'

# p StringsGitRepo.git_path # protected method
_hash = StringsGitRepo.strings_count
file_name = 'git_counts_strings.txt'
File.delete(file_name) if File.exist?(file_name)
file = File.new(file_name, 'a')
file << StringsGitRepo.strings_count(:print)
file.close
File.readlines(file_name).each { |str| puts str }
