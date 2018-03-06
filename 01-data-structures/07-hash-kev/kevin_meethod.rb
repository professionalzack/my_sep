	def find_kevin_bacon(actor)
		outmoded_actors = []
		actor.career.each do |film|
			outmoded_actors.push(actor)
			puts "film:" film.title.to_s
			film.cast.each do |star|
				unless outmoded_actors.include?(star)
					if star.name == "Kevin Bacon"
						puts "found Kevy! :)"
						return star
					elsif star == nil
						puts "No dice!"
						return star
					else
						find_kevin_bacon(star)
					end				
				end
			end	
		end
	end
end