require 'day'
class Day01 < Day
  WORDGITS=%w(o1ne t2wo th3ree fo4ur fi5ve si6x sev7en eig8ht ni9ne)
  WORDGITSMAP=Hash[WORDGITS.map { |w| [w.gsub(/\d/,''), w] }]

  class << self
    def get_digits(input)
      # grab the first digit and concatenate to the last digit.
      # /^\D*(\d).*(\d)\D*$/, "\1\2" will not work because
      # there may be only one digit, and in that case we
      # should double it.
      input.gsub(/^\D*(\d).*$/, '\1') + input.gsub(/^.*(\d)\D*$/, '\1')
    end

    def sub_word_digits(input)
      # just run through all digit words and get the cumulative
      # gsub of all of them
      WORDGITSMAP.inject(input) do |result, wordgitkv|
        result.gsub(wordgitkv[0], wordgitkv[1])
      end
    end
  end

  def part1
    input
      .map { |il| self.class.get_digits(il) }
      .map(&:to_i)
      .reduce(&:+)
      .to_s
  end

  def part2
    input
      .map { |il| self.class.sub_word_digits(il) }
      .map { |il| self.class.get_digits(il) }
      .map(&:to_i)
      .reduce(&:+)
      .to_s
  end
end
