# frozen_string_literal: true

# require 'fileutils'
# require 'find'

# path = '/home/oleg'
# path = '.'
# Find.find(path) { |file| puts file if File.directory?(file) }

# path = '/home/oleg/tmp'
# FileUtils.rm_r path, force: true

# class MyFileUtils
class MyFileUtils
  @dirs = []
  PSEUDONIM = %w[. ..].freeze
  class << self
    def dirs(path)
      return unless File.directory?(path)

      Dir.foreach(path) do |file|
        dirs("#{path}/#{file}") unless PSEUDONIM.include?(file.to_s)
      end
      @dirs << path
    end

    def rm_dir(path)
      if File.directory?(path)
        Dir.foreach(path) do |file|
          rm_dir("#{path}/#{file}") unless PSEUDONIM.include?(file.to_s)
        end
        Dir.delete(path)
      else
        File.delete(path)
      end
    end
  end
end

path = '/home/oleg/ruby'
puts MyFileUtils.dirs(path)
# dir = '/home/oleg/tmp'
# MyFileUtils.rm_dir(dir)
