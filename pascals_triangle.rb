require_relative 'display_parser'

class PascalsTriangle
  DEFAULTS = {
    color1: 'yellow',
    color2: 'magenta'
  }

  attr_accessor :triangle, :parser, :limit

  def initialize(parser = DigitsOutput, output_char = nil)
    self.triangle = []
    self.parser = DisplayParser.new(parser, @triangle)
  end

  def process(line)
    line == 1 ? append([1]) : append(values(line))
  end

  def display(padding = false, color1 = DEFAULTS[:color1], color2 = DEFAULTS[:color2], output_char = nil)
    @parser.output padding, color1, color2
  end

  def display_line(line, limit = nil, color1 = DEFAULTS[:color1], color2 = DEFAULTS[:color2], output_char = nil)
    numbers = values(line)
    @parser.output_line numbers, limit, color1, color2, output_char
  end

  private

  def append(results)
    @triangle << results
  end

  def values(line)
    line.times.collect { |i| (i == 0) ? 1 : sum(i, line) }
  end

  def sum(pos, line)
    prev_line = @triangle[line - 2]
    curr = prev_line[pos]
    left = prev_line[pos - 1]

    return 1 if left.nil? || curr.nil?
    left + curr
  end
end
