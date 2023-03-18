require 'simplecov'
require 'pry'
SimpleCov.start

require './lib/common_stat'

RSpec.describe 'CommonStat' do

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

  describe '#total_score_hash' do
    it 'returns the total of the goals scored as a hash' do
      expect(@stat_tracker.total_score_hash(@stat_tracker.games)).to be_a Hash
    end 
  end
end