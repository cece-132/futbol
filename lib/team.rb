require 'pry'
class Team
  attr_reader :id, :franchise_id, :name,
              :abbrv, :stadium, :link
  def initialize(data)
    @id = data['team_id']
    @franchise_id = data['franchiseId']
    @name = data['teamName']
    @abbrv = data['abbreviation']
    @stadium = data['Stadium']
    @link = data['link']
  end

  def self.find_name(teams, team_id)
    teams.find { |team| team.id == team_id }.name
  end

  def self.find_team_name(team_id, teams)
    teams.find { |tm| tm.id == team_id }.name
    #replacing team with team_id attribute
  end
  
end