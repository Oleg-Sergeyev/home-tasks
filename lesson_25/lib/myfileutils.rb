# frozen_string_literal: true

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

    def replace(dirs, string1, string2)
      clear_dirs
      dirs.each do |dir, children|
        children.each do |file|
          path = "#{dir}/#{file}"
          next if File.directory?(path)

          file = File.read(path)
          next unless file.include?(string1)

          write_changes(path, file, string1, string2)
        end
      end
    end

    private

    def write_changes(path, file, string1, string2)
      changed_string = file.gsub(string1, string2)
      File.open(path, 'w') do |line|
        line.write(changed_string)
        puts "File was changed: #{path.split('/').last}"
      end
    end

    def clear_dirs
      @dirs = []
    end
  end
end

# Super short line for one file...
# File.write(path,File.open(path,&:read).gsub('SuperClass', 'NewClass')
