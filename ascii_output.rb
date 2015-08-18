module AsciiOutput
  class << self
    def get_longest(data)
      data.last.length
    end

    def get_length(numbers)
      numbers.length
    end

    def line_format(num, color, char)
      char ||= ' '
      "#{char.to_s.colorize(background: color)}"
    end

    def pad(longest, curr_length)
      ' ' * ((longest - curr_length) / 2)
    end
  end
end
