require 'date'
require 'csv'
require_relative './game'
require_relative './game_statistics'

class StatTracker
  include GameStatistics
  attr_reader :games, :teams, :game_teams

  def initialize(data)
    @games = data[:games].map { |game| Game.new(game) }
    @teams = data[:teams]
    @game_teams = data[:game_teams]
  end
  
  def self.from_csv(locations)
    hash = {}
    locations.each do |key, path|
      hash[key] = CSV.parse(File.read("#{path}"), headers: true)
    end
    StatTracker.new(hash)
  end

  def highest_total_score
    total_score_hash(@games).max_by { |k,v| v }[1]
  end

  def lowest_total_score
    total_score_hash(@games).min_by { |k,v| v }[1]
  end

  def percentage_home_wins
    wins = wins_count(@games)[:home_wins].sum { |k,v| v }
    total = @games.length
    (wins/total.to_f).round(2)
  end

  def percentage_visitor_wins
    wins = wins_count(@games)[:away_wins].sum { |k,v| v }
    total = @games.length
    (wins/total.to_f).round(2)
  end
  
  def count_of_games_by_season
    total_games_by_season(@games)
  end

  def average_goals_per_game
    goals_per_game_average(@games)
  end

  def average_goals_by_season
    goal_average_by_season(@games)
  end

  def count_of_teams
    @teams.uniq.count
  end



end