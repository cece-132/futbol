class CommonStat

  def total_score_hash(stats)
    hash = {}
    stats.each do |game|
      if hash.has_key?(game.away_team_id)
        hash[game.away_team_id] += game.away_goals
      elsif hash.has_key?(game.home_team_id)
        hash[game.home_team_id] += game.home_goals
      else
        if !hash.has_key?(game.away_team_id)
          hash[game.away_team_id] = game.away_goals
        elsif !hash.has_key?(game.home_team_id)
          hash[game.home_team_id] = game.home_goals
        end
      end
    end
    hash
  end

end