require_relative 'actor'
require_relative 'film'

class BaconHunt
	attr_accessor :actors
	attr_accessor :actors_map
	attr_accessor :outmoded_actors
	attr_accessor :movies


	def initialize
		@actors = []
		@actors_map = Hash.new
		@outmoded_actors = Array.new
		@movies = Array.new
	end

	def introduce(actor)
			@actors << actor
			@actors_map[actor.name] = @actors.size - 1
	end

	def validate_career(actor, film)
		if actor == nil || film == nil
			return nil
		end
		film.cast.push(actor)
    actor.career.push(film)
	end


	def find_kevin_bacon(actor)
		outmoded_actors.push(actor)
		if actor.name == "Kevin Bacon"
			@outmoded_actors = []
			puts "you did it! " 
			@movies.each do |movie|
				puts movie.title.to_s
			end
			if @movies.size < 1
				return nil
			else
				final_cut = @movies
				@movies = []
				return final_cut
			end
		else
			if @movies.size < 7
				actor.career.each do |film|
					unless @movies.include?(film)
						@movies.push(film)
					end
					film.cast.each do |star|
						unless @outmoded_actors.include?(star)
							puts actor.name + " was in " + film.title + " with " + star.name
							self.find_kevin_bacon(star)
						end
					end
				end
			end	
			if @movies.size >= 6
				puts "~sorry to say we've reached six degrees with no success~"
				@movies = []
			end
			return actor.name
		end
	end
	
	def print		
		@actors.each do |star|
			puts star.name.to_s+": "+star.career[0].title.to_s
		end
	end


	
end



