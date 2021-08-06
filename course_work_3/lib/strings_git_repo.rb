# frozen_string_literal: true

require 'singleton'
require_relative 'table'

# class StringsCount
class StringsGitRepo
  include Singleton

  attr_accessor :hash

  @total = 0

  def self.strings_count
    hash = git_folders(git_path)
    print_format_strings(hash)
  end

  def self.scan(path)
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

  def self.root_directory?(file_path)
    File.directory?(file_path) &&
      File.expand_path(file_path) == File.expand_path(File.join(file_path, '..'))
  end

  def self.git_path(start_path = '.')
    raise NoSuchPathError unless File.exist?(start_path)

    current_path = File.expand_path(start_path)
    return_path = nil
    until root_directory?(current_path)
      if File.exist?(File.join(current_path, '.git'))
        return_path = current_path
        break
      else
        current_path = File.dirname(current_path)
      end
    end
    return_path
  end

  def self.git_folders(path)
    hash = {}
    folders = Dir.new(path).entries.reject { |x| %w[. ..].include? x }.map { |x| File.join(path, x) }
    folders.select { |file| file if File.directory?(file) }.each do |folder|
      @total = 0
      hash[folder] = scan(folder).to_s unless folder.include?('/.git')
    end
    hash
  end

  # def self.print_format_strings(hash)
  #   max_lenght = hash.max_by { |k, _v| k.length }.first.length
  #   hash.sort.each do |k, v|
  #     puts
  #     print "'#{k}'"
  #     print format("%#{4 + (max_lenght - k.length)}s", v)
  #     print ' strings'
  #   end
  #   puts
  # end
  def self.print_format_strings(hash)
    max_path_lenght = hash.max_by { |k, _v| k.length }.first.length
    max_size_lenght = hash.max_by { |_k, v| v.to_s.length }.first.length
    width = max_path_lenght + max_size_lenght + 6
    Table.new([width, 'projects', 'strings', hash])
  end
end
