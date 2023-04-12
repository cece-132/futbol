require 'pry'

module TeamStatistics

  def team_data(team_id, teams)
    hash = {}
    teams.each do |team|
      if team_id == team.id
        hash['team_id'] = team.id
        hash['franchise_id'] = team.franchise_id
        hash['team_name'] = team.name
        hash['abbreviation'] = team.abbrv
        hash['link'] = team.link
      end
    end
    hash
  end

  def games_by_team(all_games, team_id)
    hash = {}
    all_games.each do |game|
      season = (game.game_id[0,4] + (game.game_id[0,4].to_i + 1).to_s)
      if game.team_id == team_id
        if hash[season]
          hash[season] << game
        else
          hash[season] = [game]
        end
      end     
    end
    hash
  end

  def percentage_of_wins_by_season(all_team_games)
    hash = {}
    all_team_games.each do |season, games|
      total = games.length
      wins = 0
      games.each do |game|
        wins += 1 if game.result == "WIN"
      end
      hash[season] = wins/total.to_f
    end
    hash
  end

  def best_season_for(game_teams, team_id)
    percentage_of_wins_by_season(games_by_team(game_teams, team_id)).max_by do |season, percentage| 
      percentage 
    end[0]
  end

  def worst_season_for(game_teams, team_id)
    percentage_of_wins_by_season(games_by_team(game_teams, team_id)).min_by do |season, percentage| 
      percentage 
    end[0]
  end

  def average_win_percentage_for(game_teams, team_id)
    total_seasons = percentage_of_wins_by_season(games_by_team(game_teams, team_id)).count
    win_percentage_total = percentage_of_wins_by_season(games_by_team(game_teams, team_id)).sum do |season, average|
      average
    end
    (win_percentage_total / total_seasons).round(2)
  end

end