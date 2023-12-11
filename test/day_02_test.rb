require 'test/unit'

require 'app'
require 'day02'

class Day02Test < Test::Unit::TestCase
  LINE_4 = 'Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red'.freeze
  LINE_4_EXPECTATION = {
    id: 4,
    games: [
      {
        green: 1,
        red: 3,
        blue: 6
      },
      {
        green: 3,
        red: 6
      },
      {
        green: 3,
        blue: 15,
        red: 14
      }
    ]
  }.freeze

  def test_parse_line
    assert_equal(LINE_4_EXPECTATION, Day02.parse_line(LINE_4))
  end

  def test_game_round_parse
    assert_equal({ green: 1, red: 3, blue: 6 }, Day02.game_round_parse('1 green, 3 red, 6 blue'))
  end

  def test_game_round_possible
    color_counts = {green: 6, red: 6, blue: 6}
    game_rounds=[
      [{green: 1, red: 3, blue: 6}, true],
      [{green: 3, red: 6, blue: 0}, true],
      [{green: 3, red: 15, blue: 14}, false]
    ]
    game_rounds.each do |game_round|
      send("assert_#{game_round[1]}", Day02.game_round_possible?(game_round[0], color_counts))
    end
  end

  def test_part1
    input = App.load_input(day: 2, suffix: "part1sample")
    result = Day02.new(input).part1
    assert_equal("8", result)
  end

  def test_part2
    input = App.load_input(day: 2, suffix: "part1sample")
    result = Day02.new(input).part2
    assert_equal("2286", result)
  end
end
