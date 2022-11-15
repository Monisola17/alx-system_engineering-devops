#!/usr/bin/env ruby
# A regular expression to match sender, reciever and flags
puts ARGV[0].scan(/(?<=from:|to:|flags:).+?(?=\])/).join(',')
