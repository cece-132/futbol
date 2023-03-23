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
  
end