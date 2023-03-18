require 'csv'
require './lib/common_stat'

class StatTracker < CommonStat
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
    total_score_hash(@games).max_by { |k,v| v }[1]
  end

end