require_relative "day"

class DayOne < Day
	
  def partone
	total = 0
	for i in 0..@lines.length - 1
		if(@lines[i].to_i < @lines[i + 1].to_i)
			total += 1
		end
	end
	total
  end
  
  def parttwo
	@lines = @lines.map {|line| line.to_i}
	total = 0
	window_size = 3
	# sliding window over length
	for i in 0..@lines.length - window_size 
		window = @lines[i..i + window_size - 1].reduce(:+)
		next_window = @lines[(i + 1)..i + window_size].reduce(:+)

		if(window < next_window)
			total += 1
		end
	end
	total
  end
end
