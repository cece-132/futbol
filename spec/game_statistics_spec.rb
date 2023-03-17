require 'simplecov'
SimpleCov.start

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

  describe '#highest_total_score' do
    it 'returns the highest sum of the winning and losing teams scores' do
      sample = @stat_tracker.games.take(5)
      
    end 
  end

end