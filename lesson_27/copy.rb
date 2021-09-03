# frozen_string_literal: true

# require 'fileutils'

# FileUtils.cp_r '../', '/home/oleg/backup'

# class MyFileUtils
class MyFileUtils
  @dirs = []
  PSEUDONIM = %w[. ..].freeze
  class << self
    def copy(from, to)
      dirs(from)
      from_dir = from.split('/').last
      @dirs.each do |path|
        path_copy = path.split('/').drop(1).drop_while { |element| element != from_dir }.join('/')
        to_dir = "#{to}/#{path_copy}"
        array_to_dir = to_dir.split('/').drop(1)
        str = ''
        array_to_dir.each do |folder|
          str += "/#{folder}"
          Dir.mkdir(str) unless Dir.exist?(str)
        end
      end
    end

    private

    def dirs(path)
      return unless File.directory?(path)

      Dir.foreach(path) do |file|
        dirs("#{path}/#{file}") unless PSEUDONIM.include?(file.to_s)
      end
      @dirs << path
    end
  end
end

from = '/home/oleg/ruby'
to = '/home/oleg/backup'
# puts MyFileUtils.dirs(path)
MyFileUtils.copy(from, to)
