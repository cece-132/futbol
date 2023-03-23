class GameTeam
  attr_reader :game_id, :team_id, :home_or_away,
              :result, :settled_in, :head_coach,
              :goals, :shots, :tackles, :pim,
              :power_play_opportunites, :power_play_goals,
              :face_off_win_percentage, :giveaways,
              :takeaways

  def initialize(data)
    @game_id = data["game_id"]
    @team_id = data["team_id"]
    @home_or_away = data["HoA"]
    @result = data["result"]
    @settled_in = data["settled_in"]
    @head_coach = data["head_coach"]
    @goals = data["goals"].to_i
    @shots = data["shots"].to_i
    @tackles = data["tackles"].to_i
    @pim = data["pim"].to_i
    @power_play_opportunites = data["powerPlayOpportunities"].to_i
    @power_play_goals = data["powerPlayGoals"].to_i
    @face_off_win_percentage = data["faceOffWinPercentage"].to_i
    @giveaways = data["giveaways"].to_i
    @takeaways = data["takeaways"].to_i
  end

  def self.find_coach(game_teams, team_id, season)
    game_teams.find do |team| 
      if team.team_id == team_id && (team.game_id[0,4] + (team.game_id[0,4].to_i + 1).to_s) == season
        team
      end
    end.head_coach
  end
end