require 'test/unit'

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
end
