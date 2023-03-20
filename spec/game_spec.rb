require 'simplecov'
require 'pry'
SimpleCov.start

require './lib/game'
require './lib/stat_tracker'

RSpec.describe 'Game' do
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
      game = @stat_tracker.games.first

      expect(game).to be_a Game
      expect(game.game_id).to be_a String
      expect(game.season).to be_a String
      expect(game.type).to be_a String
      expect(game.date_time).to be_a Date
      expect(game.away_team_id).to be_a String
      expect(game.home_team_id).to be_a String
      expect(game.home_goals).to be_a Integer
      expect(game.away_goals).to be_a Integer
      expect(game.venue).to be_a String
      expect(game.venue_link).to be_a String
    end
  end

  describe '#total_score_hash' do
    it 'returns the total of the goals scored as a hash' do
      expect(@stat_tracker.total_score_hash(@stat_tracker.games)).to be_a Hash
    end 
  end

  describe '#wins_count(stats)' do
    it 'returns a hash' do
      expect(@stat_tracker.wins_count(@stat_tracker.games)).to be_a Hash
    end
  end

  describe '#date' do
    it 'returns a Date object' do
      game = @stat_tracker.games.first
      expect(game.date_time).to be_a Date
    end
  end

  describe '#total_games_by_season(stats)' do
    it 'returns a hash withe the total numbe of games played per season' do
      expected = {
        "20122013"=>806,
        "20162017"=>1317,
        "20142015"=>1319,
        "20152016"=>1321,
        "20132014"=>1323,
        "20172018"=>1355
      }

      expect(@stat_tracker.total_games_by_season(@stat_tracker.games)).to eq expected
      expect(@stat_tracker.total_games_by_season(@stat_tracker.games)).to be_a Hash
    end
  end
end