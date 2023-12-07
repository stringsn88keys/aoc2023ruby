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
end
