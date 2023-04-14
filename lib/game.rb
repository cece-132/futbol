require 'date'

class Game
  attr_reader :game_id, :season, :type,
              :date_time, :away_team_id,
              :home_team_id, :home_goals,
              :away_goals, :venue, :venue_link

  def initialize(data)
    @game_id = data["game_id"]
    @season = data["season"]
    @type = data["type"]
    @date_time = date(data["date_time"].split('/'))
    @away_team_id = data["away_team_id"]
    @home_team_id = data["home_team_id"]
    @home_goals = data["home_goals"].to_i
    @away_goals = data["away_goals"].to_i
    @venue = data["venue"]
    @venue_link = data["venue_link"]
  end

  def date(date_array)
    year = date_array.pop
    date_array << ('20' + year)
    month = date_array[0].to_i
    day = date_array[1].to_i
    year = date_array[2].to_i
    Date.new(year, month, day)
  end

  def self.find_game(games, game_id)
    games.find { |game| game.game_id == game_id }
  end
end