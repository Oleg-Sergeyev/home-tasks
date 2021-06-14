require_relative 'lib/local_email'
require_relative 'lib/telemetry'
require 'zip'

hardware = Telemetry.new
hardware.export

folder = Dir.pwd.to_s + '/.report/'.to_s
input_filenames = ['hardware.json', 'ethernet.json']
filename = "#{:report}.zip"
zipfile = folder.to_s + filename.to_s

Zip::File.open(zipfile, Zip::File::CREATE) do |zip_file|
  input_filenames.each do |file_name|
    zip_file.add(file_name, File.join(folder, file_name))
  end
  zip_file.get_output_stream('reportFile') { |f| f.write 'hardware.json', 'ethernet.json' }
end

email = LocalEmail.new('smtp@dvpweb.ru', 'sergeyev_ov@mail.ru', 'Hardware report')
filecontent = File.read(zipfile)
str = 'Generated report on the composition of the computer and settings of network interfaces'
email.send_mail(str, filecontent, filename)
