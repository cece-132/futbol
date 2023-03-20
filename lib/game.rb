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

  def total_score_hash(stats)
    hash = {}
    stats.each do |game|
      hash[game.game_id] = game.away_goals + game.home_goals
    end
    hash
  end

  def wins_count(stats)
    hash = { home_wins: {}, away_wins: {}, ties: 0 }
    stats.each do |game|
      if game.home_goals > game.away_goals
        if hash[:home_wins].has_key?(game.home_team_id)
          hash[:home_wins][game.home_team_id] += 1
        else
          hash[:home_wins][game.home_team_id] = 1
        end
      elsif  game.home_goals < game.away_goals
        if hash[:away_wins].has_key?(game.away_team_id)
          hash[:away_wins][game.away_team_id] += 1
        else
          hash[:away_wins][game.away_team_id] = 1
        end
      else #ties
        hash[:ties] += 1
      end
    end
    hash
  end

  def total_games_by_season(stats)
    hash = {}
    stats.each do |game|
      if !hash.has_key?(game.season)
        hash[game.season] = 1
      else
        hash[game.season] += 1
      end
    end
    hash
  end

  def goals_per_game_average(stats)
    away_goals = stats.sum { |game| game.away_goals }
    home_goals = stats.sum { |game| game.home_goals }
    ((home_goals + away_goals) / (stats.length.to_f)).round(2)
  end

  def goal_average_by_season(stats)
    hash = games_by_season(stats)
    games_by_season(stats).each do |season, games|
      away_goals = games.sum { |game| game.away_goals }
      home_goals = games.sum { |game| game.home_goals }
      hash[season] = ((home_goals + away_goals) / (games.length.to_f)).round(2)
    end
    hash
  end

  def games_by_season(stats)
    hash = {}
    stats.each do |game|
      if !hash.has_key?(game.season) 
        hash[game.season] = [game]
      else
        hash[game.season] << game
      end
    end
    hash
  end
end