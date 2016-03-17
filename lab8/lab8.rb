#!/usr/bin/env ruby

# make sure that there are 3 args passed in
if ARGV.length != 1
  puts "Incorrect Number of Arguments"
  puts "Correct Usage: full_backup.sh <keyword> <directory_name> <tarfile_name>"
end

matchingfiles = `find .`.split
matchingfiles.keep_if { |x| x =~ /.*#{ARGV[0]}.*/ }

puts matchingfiles

