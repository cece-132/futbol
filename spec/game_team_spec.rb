require 'simplecov'

SimpleCov.start

require './lib/poros/game_team'
require './lib/stat_tracker'

RSpec.describe 'GameTeam' do
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
      expect(@stat_tracker.game_teams.first).to be_a GameTeam
      expect(@stat_tracker.game_teams.first.game_id).to be_a String
      expect(@stat_tracker.game_teams.first.team_id).to be_a String
      expect(@stat_tracker.game_teams.first.home_or_away).to be_a String
      expect(@stat_tracker.game_teams.first.result).to be_a String
      expect(@stat_tracker.game_teams.first.settled_in).to be_a String
      expect(@stat_tracker.game_teams.first.head_coach).to be_a String
      expect(@stat_tracker.game_teams.first.goals).to be_a Integer
      expect(@stat_tracker.game_teams.first.shots).to be_a Integer
      expect(@stat_tracker.game_teams.first.tackles).to be_a Integer
      expect(@stat_tracker.game_teams.first.pim).to be_a Integer
      expect(@stat_tracker.game_teams.first.power_play_opportunites).to be_a Integer
      expect(@stat_tracker.game_teams.first.power_play_goals).to be_a Integer
      expect(@stat_tracker.game_teams.first.face_off_win_percentage).to be_a Integer
      expect(@stat_tracker.game_teams.first.giveaways).to be_a Integer
      expect(@stat_tracker.game_teams.first.takeaways).to be_a Integer
    end
  end

end