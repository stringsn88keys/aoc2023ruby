require 'test/unit'

require 'app'
require 'day03'

class Day03Test < Test::Unit::TestCase
  INPUT = <<INPUT
467..114..
...*......
..35..633.
......#...
617*......
.....+.58.
..592.....
......755.
...$.*....
.664.598..
INPUT

  LINES=INPUT.each_line.to_a.map(&:chomp)

  PARSE_LINE_EXPECTATIONS = [
    { 0 => "467", 5 => "114" },
    { 3 => "*" },
    { 2 => "35", 6 => "633" },
    { 6 => "#" },
    { 0 => "617", 3 => "*" },
    { 5 => "+", 7 => "58" },
    { 2 => "592" },
    { 6 => "755" },
    { 3 => "$", 5 => "*" },
    { 1 => "664", 5 => "598" }
  ]

  PARSE_LINE_EXPECTATIONS.each_with_index do |expectation, index|
    define_method("test_parse_line_#{index}") do
      assert_equal(expectation, Day03.parse_line(LINES[index]))
    end
  end

  def test_part1
    input = App.load_input(day: 3, suffix: "part1sample")
    result = Day03.new(input).part1
    assert_equal("142", result)
  end

  def test_part2
    input = App.load_input(day: 3, suffix: "part2sample")
    result = Day03.new(input).part2
    assert_equal("281", result)
  end
end
