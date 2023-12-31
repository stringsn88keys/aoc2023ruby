require 'day'

class Day03 < Day
  class << self
    REGEX = /(\d+|[^0-9.]+)/
    def parse_line(line)
      Hash[line
        .enum_for(:scan, REGEX)
        .map { Regexp.last_match }
        .map { |match| [match.begin(0), match[0]] }]
    end
  end
  def part1
    input
  end

  def part2
  end
end