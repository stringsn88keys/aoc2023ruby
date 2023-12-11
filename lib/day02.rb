require 'day'

class Day02 < Day
  class << self
    def game_id_parse(game_id)
      game_id.gsub(/^Game (\d+).*$/, '\1').to_i
    end

    def game_details_parse(game_details)
      game_details.split(';').map { |game_round| game_round_parse(game_round) }
    end

    def game_round_parse(game_round)
      game_round.split(',').map { |color_count| color_count_parse(color_count) }.reduce(&:merge)
    end

    def color_count_parse(color_count)
      color_count.strip!
      count, color = color_count.split(' ')
      { color.downcase.to_sym => count.to_i }
    end

    def parse_line(line)
      # LINE_4 = 'Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red'.freeze
      game_id, game_details = line.split(':')
      { id: game_id_parse(game_id),
        games: game_details_parse(game_details)
      }
    end

    def game_round_possible?(game_round, color_counts)
      game_round.all? do |game_color_count|
        color_counts[game_color_count[0]] >= game_color_count[1]
      end
    end

    def game_possible?(game, color_counts)
      game[:games]
        .all? { |game_round| Day02.game_round_possible?(game_round, color_counts) }
    end

    def game_power(game)
      game[:games].reduce({}) do |result, game_round|
        game_round.each do |color, count|
          result[color] ||= 0
          result[color] = [result[color], count].max
        end
        result
      end.values.reduce(&:*)
    end
  end

  COLOR_COUNTS = { red: 12, green: 13, blue: 14 }.freeze

  def part1
    input
      .map { |line| Day02.parse_line(line) }
      .select { |game| Day02.game_possible?(game, COLOR_COUNTS) }
      .map { |game| game[:id] }
      .reduce(&:+)
      .to_s
  end

  def part2
    input
      .map { |line| Day02.parse_line(line) }
      .map { |game| Day02.game_power(game) }
      .reduce(&:+)
      .to_s
  end
end