module LeagueStatistics

  def team_highest_goal_average(game_team_data)
    team_id = team_goal_data(game_team_data).max_by do |team_id, data|
      data[:goals]/data[:game_count].to_f
    end
    team_id[0]
  end

  def team_lowest_goal_average(game_team_data)
    team_id = team_goal_data(game_team_data).min_by do |team_id, data|
      data[:goals]/data[:game_count].to_f
    end
    team_id[0]
  end

  def team_highest_visiting_goal_average(game_team_data)
    team_id = visitor_scores(game_team_data).max_by do |team_id, data| 
      data[:goals]/data[:game_count].to_f
    end
    team_id[0]
  end

  def team_highest_home_goal_average(game_team_data)
    team_id = home_scores(game_team_data).max_by do |team_id, data| 
      data[:goals]/data[:game_count].to_f
    end
    team_id[0]
  end

  def team_lowest_visiting_goal_average(game_team_data)
    team_id = visitor_scores(game_team_data).min_by do |team_id, data| 
      data[:goals]/data[:game_count].to_f
    end
    team_id[0]
  end

  def team_lowest_home_goal_average(game_team_data)
    team_id = home_scores(game_team_data).min_by do |team_id, data| 
      data[:goals]/data[:game_count].to_f
    end
    team_id[0]
  end

  def team_goal_data(data)
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

  def visitor_scores(data)
    hash = {}
    data.each do |game_team|
      if !hash.has_key?(game_team.team_id)
       hash[game_team.team_id] = {goals: game_team.goals, game_count: 1} if game_team.home_or_away == 'away'
      else
        hash[game_team.team_id][:goals] += game_team.goals if game_team.home_or_away == 'away'
        hash[game_team.team_id][:game_count] += 1 if game_team.home_or_away == 'away'
      end
    end
    hash
  end

  def home_scores(data)
    hash = {}
    data.each do |game_team|
      if !hash.has_key?(game_team.team_id)
       hash[game_team.team_id] = {goals: game_team.goals, game_count: 1} if game_team.home_or_away == 'home'
      else
        hash[game_team.team_id][:goals] += game_team.goals if game_team.home_or_away == 'home'
        hash[game_team.team_id][:game_count] += 1 if game_team.home_or_away == 'home'
      end
    end
    hash
  end

end