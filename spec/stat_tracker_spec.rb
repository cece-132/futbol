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

  describe '#average_goals_per_game' do
    it "sum divided by the total number of " do
      expect(@stat_tracker.average_goals_per_game).to be_a Float
      expect(@stat_tracker.average_goals_per_game).to eq 4.22
    end
  end

  describe '#average_goals_per_season' do
    it "calculates season average goals" do
      expected = {
        "20122013"=>4.12,
        "20162017"=>4.23,
        "20142015"=>4.14,
        "20152016"=>4.16,
        "20132014"=>4.19,
        "20172018"=>4.44
      }
      expect(@stat_tracker.average_goals_by_season).to be_a Hash
      expect(@stat_tracker.average_goals_by_season).to eq expected
    end
  end

  describe '#count_of_team' do
    it 'counts the number of teams in the league' do
      expect(@stat_tracker.count_of_teams).to be_a Integer
      expect(@stat_tracker.count_of_teams).to eq 32
    end
  end

  describe '#best_offense' do
    it 'calculates the best offensive team, defined by highest average of goals across all seasons' do
      expect(@stat_tracker.best_offense).to be_a String
      expect(@stat_tracker.best_offense).to eq "Reign FC"
    end
  end

  describe '#worst_offense' do
    it 'calculates the worst offensive team, defined by lowest average of goals across all seasons' do
      expect(@stat_tracker.worst_offense).to be_a String
      expect(@stat_tracker.worst_offense).to eq "Utah Royals FC"
    end
  end

  describe '#highest_scoring_visitor' do
    it 'calculates the team with the highest scoring average while visiting team' do
      expect(@stat_tracker.highest_scoring_visitor).to be_a String
      expect(@stat_tracker.highest_scoring_visitor).to eq "FC Dallas"
    end
  end

  describe '#highest_scoring_home_team' do
    it 'calculates the team with the highest scoring average while home team' do
      expect(@stat_tracker.highest_scoring_home_team).to be_a String
      expect(@stat_tracker.highest_scoring_home_team).to eq "Reign FC"
    end
  end

  describe '#lowest_scoring_visitor' do
    it "#lowest_scoring_visitor" do
      expect(@stat_tracker.lowest_scoring_visitor).to be_a String
      expect(@stat_tracker.lowest_scoring_visitor).to eq "San Jose Earthquakes"
    end
  end

  describe '#lowest_scoring_home_team' do
    it "#lowest_scoring_home_team" do
      expect(@stat_tracker.lowest_scoring_home_team).to be_a String
      expect(@stat_tracker.lowest_scoring_home_team).to eq "Utah Royals FC"
    end
  end

  describe '#winningest_coach(season)' do
    it "#coach with the best win percentage for the season" do
      expect(@stat_tracker.winningest_coach("20132014")).to be_a String
      expect(@stat_tracker.winningest_coach("20132014")).to eq "Claude Julien"
      expect(@stat_tracker.winningest_coach("20142015")).to eq "Alain Vigneault"
    end
  end

  describe '#worst_coach' do
    it "#worst_coach" do
      expect(@stat_tracker.worst_coach("20132014")).to be_a String
      expect(@stat_tracker.worst_coach("20132014")).to eq "Ted Nolan"
      expect(@stat_tracker.worst_coach("20142015")).to eq("Craig MacTavish").or(eq("Ted Nolan"))
    end
  end

end