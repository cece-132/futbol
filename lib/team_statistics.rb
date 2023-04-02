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

  def games_by_season(all_games, team_id)
    # takes in all the games as an argument
    # sorts as hash key: season, value: [games]
    # the games will only be the ones with the team_id
  end

  def best_season_for(team_id)
    # takes games bt season hash and counts the # of wins
    # divides that sum by the total number of games
    # pull the highest average of goals
    # using .max_by
  end

end