class CommonStat

  def total_score_hash(stats)
    hash = {}
    stats.each do |game|
      hash[game.game_id] = game.away_goals + game.home_goals
    end
    hash
  end

  def wins_count(stats)
    hash = { home_wins: {}, away_wins: {}, ties: 0 }
    stats.each do |game|
      if game.home_goals > game.away_goals
        if hash[:home_wins].has_key?(game.home_team_id)
          hash[:home_wins][game.home_team_id] += 1
        else
          hash[:home_wins][game.home_team_id] = 1
        end
      elsif  game.home_goals < game.away_goals
        if hash[:away_wins].has_key?(game.away_team_id)
          hash[:away_wins][game.away_team_id] += 1
        else
          hash[:away_wins][game.away_team_id] = 1
        end
      else #ties
        hash[:ties] += 1
      end
    end
    hash
  end

end