require 'test/unit'

require 'app'
require 'day01'

class Day01Test < Test::Unit::TestCase
  {
    "1abc2" => "12",
    "1abc2n" => "12",
    "1abc2n3" => "13",
    "a1abcd" => "11"
  }.each do |input, expected|
    define_method("test_get_digits_with_#{input}") do
      assert_equal(expected, Day01.get_digits(input));
    end
  end

  def test_part1
    input = App.load_input(day: 1, suffix: "part1sample")
    result = Day01.new(input).part1
    assert_equal("142", result)
  end

  def test_part2
    input = App.load_input(day: 1, suffix: "part2sample")
    result = Day01.new(input).part2
    assert_equal("281", result)
  end
end
