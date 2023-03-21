class Team
  attr_reader :id, :franchise_id, :name,
              :abbrv, :stadium, :link
  def initialize(data)
    @id = data[:id]
    @franchise_id = data[:franchise_id]
    @name = data[:name]
    @abbrv = data[:abbrv]
    @stadium = data[:stadium]
    @link = data[:link]
  end
  
end