#!/usr/bin/env ruby

# make sure that there are 3 args passed in
if ARGV.length != 3
  puts "Incorrect Number of Arguments"
  puts "Correct Usage: full_backup.sh <keyword> <directory_name> <tarfile_name>"
end

matchingFiles = Array.new
Dir.chdir("#{ARGV[1]}") do
  matchingFiles = `find .`.split
  matchingFiles.keep_if { |file| file =~ /.*#{ARGV[0]}.*/ }
end

filesToTar = ""
matchingFiles.each do |file|
  filesToTar << (ARGV[1] + "/" + file.delete("./") + " ")
end

`tar -cvf #{ARGV[2]} #{filesToTar} 2>/dev/null`

