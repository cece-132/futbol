require 'simplecov'
require 'pry'
SimpleCov.start

require './lib/game'
require './lib/stat_tracker'

RSpec.describe 'StatTracker' do

  before :each do
    @game_path = './data/games.csv'
    @team_path = './data/teams.csv'
    @game_teams_path = './data/game_teams.csv'

    @locations = {
      games: @game_path,
      teams: @team_path,
      game_teams: @game_teams_path
    }

    @stat_tracker = StatTracker.from_csv(@locations)
  end

  describe '.initialize' do
    it 'exists and has attributes' do
      expect(@stat_tracker).to be_a StatTracker
      expect(@stat_tracker.games).to be_a Array
      expect(@stat_tracker.games.first).to be_a Game
      # expect(@stat_tracker.teams.first).to be_a Team
      # expect(@stat_tracker.game_teams).to be_a GameTeam
    end
  end

  describe '.from_csv(locations)' do
    it 'should return a hash with csv data' do
      expect(@stat_tracker).to be_a StatTracker
    end
  end

  describe '#highest_total_score' do
    it 'returns the highest sum of the winning and losing teams scores' do
      expect(@stat_tracker.highest_total_score).to be_a Integer
      expect(@stat_tracker.highest_total_score).to eq 11
    end 
  end

  describe '#lowest_total_score' do
    it 'returns the highest sum of the winning and losing teams scores' do
      expect(@stat_tracker.lowest_total_score).to be_a Integer
      expect(@stat_tracker.lowest_total_score).to eq 0
    end 
  end

  describe '#percentage_home_wins' do
    it 'percentage(float) of games that a home team has won (rounded to the nearest 100th)' do
      expect(@stat_tracker.percentage_home_wins).to be_a Float
      expect(@stat_tracker.percentage_home_wins).to eq 0.44
    end
  end

  describe '#percentage_visitor_wins' do
    it 'percentage(float) of games that a home team has won (rounded to the nearest 100th)' do
      expect(@stat_tracker.percentage_visitor_wins).to be_a Float
      expect(@stat_tracker.percentage_visitor_wins).to eq 0.36
    end
  end

  describe '#count_of_games_by_season' do
    it 'returns a hash that counts the total games by season' do
      expected = {
        "20122013"=>806,
        "20162017"=>1317,
        "20142015"=>1319,
        "20152016"=>1321,
        "20132014"=>1323,
        "20172018"=>1355
      }
      expect(@stat_tracker.count_of_games_by_season).to be_a Hash
      expect(@stat_tracker.count_of_games_by_season).to eq expected
    end
  end

end