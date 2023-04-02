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

end