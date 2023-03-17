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

  describe '.from_csv(locations)' do
    it 'should return a hash with csv data' do
      expect(@stat_tracker).to be_a Hash
      expect(@stat_tracker).to have_key :games
      expect(@stat_tracker).to have_key :game_teams
      expect(@stat_tracker).to have_key :teams

      @stat_tracker.each do |title, table|
        expect(title).to be_a Symbol
        expect(table).to be_a CSV::Table
      end
    end
  end
end