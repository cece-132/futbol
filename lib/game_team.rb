class GameTeam
  attr_reader :game_id, :team_id, :home_or_away,
              :result, :settled_in, :head_coach,
              :goals, :shots, :tackles, :pim,
              :power_play_opportunites, :power_play_goals,
              :face_off_win_percentage, :giveaways,
              :takeaways

  def initialize(data)
    @game_id = data[:game_id]
    @team_id = data[:team_id]
    @home_or_away = data[:home_or_away]
    @result = data[:result]
    @settled_in = data[:settled_in]
    @head_coach = data[:head_coach]
    @goals = data[:goals].to_i
    @shots = data[:shots].to_i
    @tackles = data[:tackles].to_i
    @pim = data[:pim].to_i
    @power_play_opportunites = data[:power_play_opportunites].to_i
    @power_play_goals = data[:power_play_goals].to_i
    @face_off_win_percentage = data[:face_off_win_percentage].to_i
    @giveaways = data[:giveaways].to_i
    @takeaways = data[:takeaways].to_i
  end
end