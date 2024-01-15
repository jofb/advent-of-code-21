module DayMethods

	def partone
		raise NotImplementedError
	end
	
	def parttwo
		raise NotImplementedError
	end
end

class Day
	
	include DayMethods
	
	def initialize
		@lines = File.read("input.txt").split
	end
  
	def run(part)
    part == 1? partone : parttwo
	end
	
end