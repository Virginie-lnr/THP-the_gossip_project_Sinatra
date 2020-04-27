# require 'pry'
require 'csv'

class Gossip
  attr_accessor :author, :content
  
  def initialize(author, content)
    @author = author
    @content = content
  end

  def to_s
    return "L'auteur est #{self.author}, le potin est #{self.content}"
  end

  def save 
    CSV.open("./db/gossip.csv", "ab") do |csv|
      csv << [@author, @content]
    end
  end

  def self.all
    all_gossips = [] #on initialise un array vide
    csv = CSV.read("./db/gossip.csv")
    csv.each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
  return all_gossips #on retourne un array rempli d'objets Gossip
  end

  

  def self.find(id)
    gossip_by_id = {}
    id_start = 1 
    csv = CSV.read("./db/gossip.csv")
    csv.each do |csv_line|
      gossip_by_id[id_start] = Gossip.new(csv_line[0], csv_line[1])
      id_start += 1
    end
  return gossip_by_id[id]
  end

end
# puts Gossip.all

# binding.pry