class Film
	attr_accessor :title
	attr_accessor :cast

	def initialize(title)
		@title = title
		@cast = Array.new
	end
	
end