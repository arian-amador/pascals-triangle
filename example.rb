#!/usr/bin/env ruby
require_relative 'pascals_triangle'

p = PascalsTriangle.new AsciiOutput
last = Float::INFINITY

(1..last).each do |line|
  p.process line
  puts p.display_line line, 270
end

# Display final results
# puts p.display true, 'yellow'
