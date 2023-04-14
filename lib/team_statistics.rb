
require_relative './poros/game'

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

  def team_most_goals_scored(game_teams, team_id)
    highest_score = 0
    games_by_team(game_teams, team_id).each do |season, games|
      games.each do |game|
        highest_score = game.goals if game.goals > highest_score
      end
    end
    highest_score
  end

  def team_fewest_goals_scored(game_teams, team_id)
    lowest_score = 0
    games_by_team(game_teams, team_id).each do |season, games|
      games.each do |game|
        lowest_score = game.goals if game.goals < lowest_score
      end
    end
    lowest_score
  end

  def opponent_wins_hash(game_teams, games, team_id)
    hash = {}
    games_by_team(game_teams, team_id).each do |season, gts|
      gts.each do |gt|
        game = Game.find_game(games, gt.game_id)
        if gt.result == 'LOSS'
          if gt.home_or_away == 'away' #team_id == away
            if !hash[game.home_team_id]
              hash[game.home_team_id] = {wins: 1, games_played: 1}
            else
              hash[game.home_team_id][:wins] += 1
              hash[game.home_team_id][:games_played] += 1
            end
          elsif gt.home_or_away == 'home'
            if !hash[game.away_team_id]
              hash[game.away_team_id] = {wins: 1, games_played: 1}
            else
              hash[game.away_team_id][:wins] += 1
              hash[game.away_team_id][:games_played] += 1
            end
          end
        elsif gt.result == 'WIN'
          if gt.home_or_away == 'away' #team_id == away
            if !hash[game.home_team_id]
              hash[game.home_team_id] = {wins: 0, games_played: 1}
            else
              hash[game.home_team_id][:games_played] += 1
            end
          elsif gt.home_or_away == 'home'
            if !hash[game.away_team_id]
              hash[game.away_team_id] = {wins: 0, games_played: 1}
            else
              hash[game.away_team_id][:games_played] += 1
            end
          end
        end
      end
    end
    hash
  end

  def team_fav_opponent(game_teams, games, team_id)
    opponent_wins_hash(game_teams, games, team_id).min_by do |t_id, stats|
      stats[:wins].to_f / stats[:games_played]
    end[0]
  end

  def rival_opponent(game_teams, games, team_id)
    opponent_wins_hash(game_teams, games, team_id).max_by do |t_id, stats|
      stats[:wins].to_f / stats[:games_played]
    end[0]
  end

end