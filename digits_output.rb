module DigitsOutput
  class << self
    def get_longest(data)
      data.last.join(' ').length
    end

    def get_length(numbers)
      numbers.join(' ').length
    end

    def line_format(num, color, char)
      "#{num.to_s.colorize(color)} "
    end

    def pad(longest, curr_length)
      ' ' * ((longest - curr_length) / 2)
    end
  end
end
