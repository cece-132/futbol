require 'simplecov'
require 'pry'
SimpleCov.start

require './lib/team'
require './lib/stat_tracker'

RSpec.describe 'Team' do
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
      expect(@stat_tracker.teams.first).to be_a Team 
      expect(@stat_tracker.teams.first.id).to be_a String
      expect(@stat_tracker.teams.first.franchise_id).to be_a String
      expect(@stat_tracker.teams.first.name).to be_a String
      expect(@stat_tracker.teams.first.abbrv).to be_a String
      expect(@stat_tracker.teams.first.stadium).to be_a String
      expect(@stat_tracker.teams.first.link).to be_a String
    end
  end

end