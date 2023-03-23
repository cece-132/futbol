module LeagueStatistics

  def team_highest_goal_average(game_team_data)
    team_id = team_goal_averages(game_team_data).max_by do |team_id, data|
      data[:goals]/data[:game_count].to_f
    end
    team_id[0]
  end

  def team_goal_averages(data)
    hash = {}
    data.each do |game_team|
      if !hash.has_key?(game_team.team_id)
       hash[game_team.team_id] = {goals: game_team.goals, game_count: 1}
      else
        hash[game_team.team_id][:goals] += game_team.goals
        hash[game_team.team_id][:game_count] += 1
      end
    end
    hash
  end


end