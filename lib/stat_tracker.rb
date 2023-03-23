require 'date'
require 'csv'
require_relative './game'
require_relative './team'
require_relative './game_team'
require_relative './game_statistics'
require_relative './league_statistics'
require_relative './season_statistics'

class StatTracker
  include GameStatistics
  include LeagueStatistics
  include SeasonStatistics
  attr_reader :games, :teams, :game_teams

  def initialize(data)
    @games = data[:games].map { |game| Game.new(game) }
    @teams = data[:teams].map { |team| Team.new(team) }
    @game_teams = data[:game_teams].map { |game_team| GameTeam.new(game_team) }
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

  def best_offense
    Team.find_name(@teams, team_highest_goal_average(@game_teams))
  end

  def worst_offense
    Team.find_name(@teams, team_lowest_goal_average(@game_teams))
  end

  def highest_scoring_visitor
    Team.find_name(@teams, team_highest_visiting_goal_average(@game_teams))
  end

  def highest_scoring_home_team
    Team.find_name(@teams, team_highest_home_goal_average(@game_teams))
  end

  def lowest_scoring_visitor
    Team.find_name(@teams, team_lowest_visiting_goal_average(@game_teams))
  end

  def lowest_scoring_home_team
    Team.find_name(@teams, team_lowest_home_goal_average(@game_teams))
  end

  def winningest_coach(season)
    GameTeam.find_coach(@game_teams, best_win_percentage(@game_teams, season), season)
  end
end