#!/usr/bin/env ruby
Dir.chdir()
Dir.foreach("/Documents") {|x| puts "Got #{x}" }
