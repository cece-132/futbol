require 'csv'

class StatTracker
  
  def self.from_csv(locations)
    hash = {}
    locations.each do |key, path|
      hash[key] = CSV.parse(File.read("#{path}"), headers: true)
    end
    hash
  end

  def highest_total_score
    
  end

end