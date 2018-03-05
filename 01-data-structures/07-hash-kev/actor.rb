class Actor
	attr_accessor :name
	attr_accessor :career

	def initialize(name)
		@name = name
		@career = Array.new
	end
end