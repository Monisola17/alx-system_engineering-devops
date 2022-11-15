#!/usr/bin/env ruby
# A regular expression to match a 10 digit number
puts ARGV[0].scan(/^\d{10}$/).join
