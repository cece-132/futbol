module SeasonStatistics

  def best_win_percentage(game_team_data, season)
    season_games = game_data(game_team_data, season)
    team_id = season_games.max_by do |team_id, data|
      data[:wins]/(data[:losses] + data[:ties] + data[:wins]).to_f
    end
    team_id[0] 
  end

  def worst_win_percentage(game_team_data, season)
    season_games = game_data(game_team_data, season)
    team_id = season_games.min_by do |team_id, data|
      data[:wins]/(data[:losses] + data[:ties] + data[:wins]).to_f
    end
    team_id[0] 
  end

  def game_data(data, season)
    hash = {}
    data.each do |game_team|
      if (game_team.game_id[0,4] + (game_team.game_id[0,4].to_i + 1).to_s) == season
        if !hash.has_key?(game_team.team_id)
          hash[game_team.team_id] = {wins: 0, losses: 0, ties: 0 }
          if game_team.result == 'WIN'
            hash[game_team.team_id][:wins] += 1
          elsif game_team.result == 'LOSS'
            hash[game_team.team_id][:losses] += 1
          elsif game_team.result == 'TIE'
            hash[game_team.team_id][:ties] += 1
          end
        else
          if game_team.result == 'WIN'
            hash[game_team.team_id][:wins] += 1
          elsif game_team.result == 'LOSS'
            hash[game_team.team_id][:losses] += 1
          elsif game_team.result == 'TIE'
            hash[game_team.team_id][:ties] += 1
          end
        end
      end
    end
    hash
  end

  def season_games_by_season(data, season)
    data.map do |game|
      if (game.game_id[0,4] + (game.game_id[0,4].to_i + 1).to_s) == season && game.game_id[4..5] == '02'
        game
      end
    end.compact
  end
  

  def most_accurate_team_for_season(season, game_teams)
    game_teams.max_by do |game|
      (game.goals / game.shots)
    end.team_id
    #adding .game_id and sending that to find team method
  end

  def least_accurate_team_for_season(season, game_teams)
    game_teams.min_by do |game|
      (game.goals / game.shots)
    end.team_id
  end

  def highest_tackles_for_season(season, game_teams)
    season_tackle_data(season, game_teams).max_by { |team_id, tackle_total| tackle_total }[0]
  end

  def least_tackles_for_season(season, game_teams)
    season_tackle_data(season, game_teams).min_by { |team_id, tackle_total| tackle_total }[0]
  end

  def season_tackle_data(season, game_teams)
    hash = {}
    game_teams.each do |game|
      if hash[game.team_id]
        hash[game.team_id] += game.tackles
      else
        hash[game.team_id] = game.tackles
      end
    end
    hash
  end

end