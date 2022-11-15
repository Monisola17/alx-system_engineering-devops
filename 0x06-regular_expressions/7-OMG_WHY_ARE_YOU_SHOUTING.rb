#!/usr/bin/env ruby
# A regular expression matching only capital letters
puts ARGV[0].scan(/[[:upper:]]/).join
