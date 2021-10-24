# frozen_string_literal: true

require 'json'
require 'fileutils'

# Class Telemetry
class Telemetry
  PATH = Dir.pwd.to_s + '/.report'.to_s
  FILE_LOG = "#{PATH}/info.log"
  HARDWARE_JSON = "#{PATH}/hardware.json"
  ETHERNET_JSON = "#{PATH}/ethernet.json"

  def initialize
    @hardware_arr = []
    @ethernet_arr = []
  end

  def export
    chkfiles
    File.open(HARDWARE_JSON, 'wb') { |json_hwfile| json_hwfile.puts JSON.pretty_generate(hwjson) }
    File.open(ETHERNET_JSON, 'wb') { |json_ethfile| json_ethfile.puts JSON.pretty_generate(ethjson) }
  end

  private

  def getinfo(operation)
    file_log = File.new(FILE_LOG, 'w')
    file_log.write(operation)
    file_log.close
    file_log = File.new(FILE_LOG, 'r:UTF-8')
    file_log.readlines
  end

  def hwjson
    param_arr = []
    dev = ''
    getinfo(`lspci -v`).each do |string|
      string = string.gsub(/^$\n/, '')
      string.each_line do |str|
        if !str.start_with?("\t") || !str.start_with?('')
          if param_arr.empty? != true
            @hardware_arr.push(dev => param_arr)
            param_arr = []
          end
          dev = str[0..7].rstrip!
          param_arr.push(
            str.gsub(str[0..7], '').lines(':')[0].chop.gsub(' ', '_').downcase =>
            str.gsub(str[0..7], '').lines(':')[1].chop.lstrip!.downcase
          )
        elsif str.gsub(str[0], '').lines(':')[1].nil? == false
          param_arr.push(
            str.gsub(str[0], '').lines(':')[0].chop.gsub(' ', '_').downcase =>
            str.gsub(str[0], '').lines(':')[1].chop.lstrip!.downcase
          )
        else
          param_arr.push(str.gsub(str[0], '').chop => 'NA')
        end
      end
    end
    @hardware_arr
  end

  def ethjson
    param_arr = []
    device = ''
    getinfo(`ifconfig`).each do |string|
      string = string.gsub(/^$\n/, '')
      string.each_line do |str|
        if !str.start_with?(' ')
          if param_arr.empty? != true
            @ethernet_arr.push(device => param_arr)
            param_arr = []
          end
          device = str.lines(':')[0].chop
          param_arr.push(str.lines(':')[1].chop.lstrip!.downcase)
        else
          param_arr.push(str.gsub(str[0..7], '').chop)
        end
      end
    end
    @ethernet_arr.push(device => param_arr)
  end

  def chkfiles
    if Dir.exist?(PATH) == false
      Dir.mkdir(PATH)
    else
      FileUtils.rm_r PATH, force: true
    end
  end
end
