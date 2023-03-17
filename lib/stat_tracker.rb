require 'csv'

class StatTracker
  attr_reader :games, :teams, :game_teams

  def initialize(games, teams, game_teams)
    @games = games.map { |game| Game.new(game) }
    @teams = teams
    @game_teams = game_teams
  end
  
  def self.from_csv(locations)
    hash = {}
    locations.each do |key, path|
      hash[key] = CSV.parse(File.read("#{path}"), headers: true)
    end
    StatTracker.new(hash[:games], hash[:teams], hash[:game_teams])
  end

  def highest_total_score
    highest_total_score_hash.max_by { |k,v| v }[1]
  end

  def highest_total_score_hash
    hash = {}
    @games.each do |game|
      if hash.has_key?(game.away_team_id)
        hash[game.away_team_id] += game.away_goals
      elsif hash.has_key?(game.home_team_id)
        hash[game.home_team_id] += game.home_goals
      else
        if !hash.has_key?(game.away_team_id)
          hash[game.away_team_id] = game.away_goals
        elsif !hash.has_key?(game.home_team_id)
          hash[game.home_team_id] = game.home_goals
        end
      end
    end
    hash
  end

end