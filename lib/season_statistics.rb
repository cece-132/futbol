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
      if (game.game_id[0,4] + (game.game_id[0,4].to_i + 1).to_s) == season
        game
      end
    end.compact
  end
  
end