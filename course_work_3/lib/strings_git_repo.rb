# frozen_string_literal: true

require 'date'
require 'singleton'
require 'tty-table'

# class StringsCount
class StringsGitRepo
  include Singleton

  @total = 0

  def self.strings_count(method = :hash)
    hash = git_folders(git_path)
    case method
    when :print
      print_format_strings(hash)
    when :hash
      hash
    end
  end

  # protected
  class << self
    protected

    def scan(path)
      entries = Dir.new(path)
                   .entries
                   .reject { |x| %w[. ..].include? x }
                   .map { |x| File.join(path, x) }
      entries.each do |item|
        scan(item) if File.directory?(item)

        @total += File.new(item, chomp: true).readlines.size if File.extname(item) == '.rb'
      end
      @total
    end

    def root_directory?(file_path)
      File.directory?(file_path) &&
        File.expand_path(file_path) == File.expand_path(File.join(file_path, '..'))
    end

    def git_path(start_path = '.')
      raise NoSuchPathError unless File.exist?(start_path)

      current_path = File.expand_path(start_path)
      check_path(current_path)
    end

    def check_path(current_path)
      until root_directory?(current_path)
        return current_path if File.exist?(File.join(current_path, '.git'))

        current_path = File.dirname(current_path)
      end
      current_path
    end

    def git_folders(path)
      hash = {}
      folders = Dir.new(path).entries.reject { |x| %w[. ..].include? x }.map { |x| File.join(path, x) }
      folders.select { |file| file if File.directory?(file) }.each do |folder|
        @total = 0
        hash[folder] = scan(folder).to_s unless folder.include?('/.git')
      end
      hash
    end

    def print_format_strings(hash)
      table = TTY::Table.new(%w[projects strings], hash.to_a)
      "Report generated: #{DateTime.now.strftime('%d-%m-%Y %H:%M')}\n#{table.render(:ascii)}"
    end
  end
end
