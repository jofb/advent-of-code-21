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
		@lines = File.readlines("input.txt", chomp:true)
	end
  
	def run(part)
    part == 1? partone : parttwo
	end
	
end