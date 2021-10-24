# frozen_string_literal: true

# class MyFileUtils
class MyFileUtils
  @dirs = []
  @changed_files = false
  PSEUDONIM = %w[. ..].freeze
  class << self
    def dirs(path)
      clear_instance_variables
      getdirs(path)
    end

    def replace(path, string1, string2)
      dirs_and_files(path).each do |dir, children|
        children.each do |file|
          path = "#{dir}/#{file}"
          next if File.directory?(path)

          file = File.read(path)
          next unless file.include?(string1)

          write_changes(path, file, string1, string2)
        end
      end
      puts 'Nothing changed' if @changed_files == false
    end

    def dirs_and_files(path)
      dirs(path)
      @dirs.reduce([]) { |arr, dir| arr << [dir, Dir.children(dir)] }
    end

    private

    def getdirs(path)
      return unless File.directory?(path)

      Dir.foreach(path) do |file|
        getdirs("#{path}/#{file}") unless PSEUDONIM.include?(file.to_s)
      end
      @dirs << path
    end

    def write_changes(path, file, string1, string2)
      changed_string = file.gsub(string1, string2)
      File.open(path, 'w') do |line|
        line.write(changed_string)
        puts "File: '#{path.split('/').last}' was changed!"
      end
      @changed_files = true
    end

    def clear_instance_variables
      @dirs = []
      @changed_files = false
    end
  end
end

# Super short line for one file...
# File.write(path,File.open(path,&:read).gsub('SuperClass', 'SuperClass')
