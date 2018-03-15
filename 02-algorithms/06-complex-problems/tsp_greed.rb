class City
	attr_accessor :name
	attr_accessor :neighbors
	attr_accessor :distance

	def initialize(name)
		@name = name
		@neighbors = Array.new
		@distance = Hash.new
		@visited = false
	end
	
	def map_out(city, miles)
			@neighbors << city
			@distance[city] = miles
	end
end

def nearest_neighbor(graph_of_cities, current_city)
  itinerary = graph_of_cities
  next_city = itinerary[0]
  for closer in itinerary[1..itinerary.length-1]
    if closer.distance[current_city] < next_city.distance[current_city]
        next_city = closer
    end
  end
  puts next_city.name
  itinerary.delete(next_city)
  if itinerary.length >= 1
    nearest_neighbor(itinerary, next_city)
  else
    puts "thats it!"
  end
end
    
 sf = City.new("San Francisco")
nyc = City.new("New York City")
chi = City.new("Chicago")
sea = City.new("Seattle")
la = City.new("Los Angeles")
ftl = City.new("Ft Lauderdale")



sf.map_out(nyc, 2900)
sf.map_out(chi, 2132)
sf.map_out(sea, 808)
sf.map_out(la, 383)
sf.map_out(ftl, 3091)

nyc.map_out(sf, 2900)
nyc.map_out(chi, 789)
nyc.map_out(sea, 2852)
nyc.map_out(la, 2790)
nyc.map_out(ftl, 1260)

chi.map_out(sf, 2132)
chi.map_out(nyc, 789)
chi.map_out(sea, 2015)
chi.map_out(la, 2032)
chi.map_out(ftl, 1356)

sea.map_out(sf, 808)
sea.map_out(nyc, 2852)
sea.map_out(chi, 2015)
sea.map_out(la, 1135)
sea.map_out(ftl, 3276)

la.map_out(sf, 383)
la.map_out(la, 2790)
la.map_out(chi, 2032)
la.map_out(sea, 1135)
la.map_out(ftl, 2709)

ftl.map_out(sf, 3091)
ftl.map_out(nyc, 1260)
ftl.map_out(chi, 1356)
ftl.map_out(sea, 3276)
ftl.map_out(la, 2709)

array = [nyc, chi, sea, la, ftl]

puts nearest_neighbor(array, sf)
    
  