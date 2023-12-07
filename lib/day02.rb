class Day02
  class << self
    def game_id_parse(game_id)
      game_id.gsub(/^Game (\d+).*$/, '\1').to_i
    end

    def game_details_parse(game_details)
      game_details.split(';').map{|game_round| game_round_parse(game_round) }
    end

    def parse_line(line)
      # LINE_4 = 'Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red'.freeze
      game_id, game_details = line.split(':')
      { id: game_id_parse(game_id),
        games: game_details_parse(game_details)
      }
    end
  end
end