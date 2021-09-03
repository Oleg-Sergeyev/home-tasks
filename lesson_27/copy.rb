# frozen_string_literal: true

# class MyFileUtils
class MyFileUtils
  @dirs = []
  PSEUDONIM = %w[. ..].freeze
  class << self
    def copy(from, to)
      dirs(from)
      @dirs.each do |path|
        files = getfiles(path)
        path_copy = path_to(files, from)
        to_dir = "#{to}/#{path_copy}".split('/').drop(1)
        mk_dir(to_dir)
        files_in_folder(files, path, to_dir)
      end
    end

    private

    def copy_file(src, dest)
      File.write(dest, File.read(src))
    end

    def files_in_folder(files, path, to_dir)
      files.last.each do |file|
        unless File.exist?("/#{to_dir.join('/')}/#{file}")
          copy_file("/#{path}/#{file}",
                    "/#{to_dir.join('/')}/#{file}")  # File.write("/#{path}/#{file}", File.read("/#{to_dir.join('/')}/#{file}"))
        end
      end
    end

    def path_to(files, from)
      files.first.split('/').drop(1).drop_while { |element| element != from.split('/').last }.join('/')
    end

    def mk_dir(array_to_dir)
      str = ''
      array_to_dir.each do |folder|
        str += "/#{folder}"
        Dir.mkdir(str) unless Dir.exist?(str)
      end
    end

    def getfiles(path)
      files = Dir.entries(path).each_with_object([]) do |file, arr|
        arr << file unless File.directory?(file)
      end
      [path, files]
    end

    def dirs(path)
      return unless File.directory?(path)

      Dir.foreach(path) do |file|
        dirs("#{path}/#{file}") unless PSEUDONIM.include?(file.to_s)
      end
      @dirs << path
    end
  end
end

from = '/home/oleg/test'
to = '/home/oleg/backup'
# puts MyFileUtils.dirs(path)
MyFileUtils.copy(from, to)
