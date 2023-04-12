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
    it "coach with the highest win percentage for the season" do
      expect(@stat_tracker.winningest_coach("20132014")).to be_a String
      expect(@stat_tracker.winningest_coach("20132014")).to eq "Claude Julien"
      expect(@stat_tracker.winningest_coach("20142015")).to eq "Alain Vigneault"
    end
  end

  describe '#worst_coach(season)' do
    it "coach with the lowest win percentage for the season" do
      expect(@stat_tracker.worst_coach("20132014")).to be_a String
      expect(@stat_tracker.worst_coach("20132014")).to eq "Ted Nolan"
      expect(@stat_tracker.worst_coach("20142015")).to eq("Craig MacTavish").or(eq("Ted Nolan"))
    end
  end

  describe '#most_accurate_team(season)' do
    it "Name of the Team with the highest ratio of shots to goals for the season" do
      expect(@stat_tracker.most_accurate_team("20132014")).to be_a String
      expect(@stat_tracker.most_accurate_team("20132014")).to eq "Orlando City SC"
      expect(@stat_tracker.most_accurate_team("20142015")).to eq "Atlanta United"
    end
  end

  describe '#least_accurate_team(season)' do
    it "Name of the Team with the lowest ratio of shots to goals for the season" do
      expect(@stat_tracker.least_accurate_team("20132014")).to be_a String
      expect(@stat_tracker.least_accurate_team("20132014")).to eq "Philadelphia Union"
      expect(@stat_tracker.least_accurate_team("20142015")).to eq "FC Cincinnati"
    end
  end

  describe '#most_tackles(season)' do
    it "Name of the Team with the most tackles in the season" do
      expect(@stat_tracker.most_tackles("20132014")).to be_a String
      expect(@stat_tracker.most_tackles("20132014")).to eq "Orlando Pride"
      expect(@stat_tracker.most_tackles("20142015")).to eq "Seattle Sounders FC"
    end
  end

  describe '#least_tackles(season)' do
    it "Name of the Team with the least tackles in the season" do
      expect(@stat_tracker.fewest_tackles("20132014")).to be_a String
      expect(@stat_tracker.fewest_tackles("20132014")).to eq "New England Revolution"
      expect(@stat_tracker.fewest_tackles("20142015")).to eq "Orlando City SC"
    end
  end

  describe '#team_info(team_id)' do
    it 'returns a hash for attributes: team_id, franchise_id, team_name, abbreviation, and link' do
      expected = {
        "team_id" => "18",
        "franchise_id" => "34",
        "team_name" => "Minnesota United FC",
        "abbreviation" => "MIN",
        "link" => "/api/v1/teams/18"
      }
  
      expect(@stat_tracker.team_info("18")).to be_a Hash
      expect(@stat_tracker.team_info("18")).to have_key('team_id')
      expect(@stat_tracker.team_info("18")['team_id']).to be_a String

      expect(@stat_tracker.team_info("18")).to have_key('franchise_id')
      expect(@stat_tracker.team_info("18")['franchise_id']).to be_a String

      expect(@stat_tracker.team_info("18")).to have_key('team_name')
      expect(@stat_tracker.team_info("18")['team_name']).to be_a String

      expect(@stat_tracker.team_info("18")).to have_key('abbreviation')
      expect(@stat_tracker.team_info("18")['abbreviation']).to be_a String

      expect(@stat_tracker.team_info("18")).to have_key('link')
      expect(@stat_tracker.team_info("18")['link']).to be_a String

      expect(@stat_tracker.team_info("18")).to eq expected
    end
  end

  describe '#best_season(team_id)' do
    it 'season with the highest win percentage for a team' do
      expect(@stat_tracker.best_season("6")).to be_a String
      expect(@stat_tracker.best_season("6")).to eq "20132014"
    end
  end

  describe '#worst_season(team_id)' do
    it "#worst_season" do
      expect(@stat_tracker.worst_season("6")).to be_a String
      expect(@stat_tracker.worst_season("6")).to eq "20142015"
    end
  end

  describe '#average_win_percentage(team_id)' do
    it "#average_win_percentage" do
      expect(@stat_tracker.average_win_percentage("6")).to be_a Float
      expect(@stat_tracker.average_win_percentage("6")).to eq 0.49
    end
  end

  describe '#most_goals_scored(team_id)' do
    it "#most_goals_scored" do
      expect(@stat_tracker.most_goals_scored("18")).to be_a Integer
      expect(@stat_tracker.most_goals_scored("18")).to eq 7
    end
  end

  describe '#fewest_goals_scored(team_id)' do
    it "#fewest_goals_scored" do
      expect(@stat_tracker.fewest_goals_scored("18")).to be_a Integer
      expect(@stat_tracker.fewest_goals_scored("18")).to eq 0
    end
  end


end