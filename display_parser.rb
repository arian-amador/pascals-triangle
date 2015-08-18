require 'colorize'

require_relative 'digits_output'
require_relative 'ascii_output'

class PascalsTriangle
  class DisplayParser
    attr_accessor :triangle, :parser, :char

    def initialize(parser, triangle)
      self.triangle = triangle
      self.parser = parser
    end

    def output(padding, color1, color2, char)
      res = []
      longest = @parser.get_longest(@triangle)

      @triangle.each do |numbers|
        out = ''
        out += @parser.pad(longest, @parser.get_length(numbers)) if padding
        out += output_line(numbers, color1, color2, char)
        res << out
      end
      res
    end

    def output_line(numbers, last = nil, color1, color2, char)
      last ||= numbers.length

      out = ''
      numbers[0..last].each do |num|
        color = num.even? ? color1.to_sym : color2.to_sym
        out += @parser.line_format(num, color, char)
      end
      out
    end
  end
end
