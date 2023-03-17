require 'pry'
require 'csv'
class StatTracker
  
  def self.from_csv(locations)
    games =
    game_teams =
    locations.map do |key, path|
      CSV.read(path, headers: true, header_converters: :symbol)
    end
    binding.pry
  end

  def locations
    
  end
end