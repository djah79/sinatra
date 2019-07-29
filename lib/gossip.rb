
class Gossip
	attr_accessor :name, :text

	def initialize(autor , content)
		@name = autor
		@text = content
	end
	def save
		CSV.open("db/gossip.csv", "ab") do |csv|
    		csv << [@name, @text]
		end
	end
	def self.all
  		all_gossips = []
  		CSV.read("db/gossip.csv").each do |csv_line|
    		all_gossips << Gossip.new(csv_line[0], csv_line[1])
  		end
  	return all_gossips
	end
	def self.find(testo)
		i = 1
		Gossip.all.each do |ss| 
			if i==testo
				return [ss , testo]
				break
			end
			i += 1
		end
	end
	def self.edit(id,autor,text)
		i = 1
		GCSV.open("db/gossip.csv", "w+") do |csv|
			if i==id
				csv << [autor, text]
				break
			end
			i += 1
    	end	
	end
end
