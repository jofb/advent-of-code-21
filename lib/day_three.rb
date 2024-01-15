require_relative "day"

class DayThree < Day
  
  def partone
    bit_counts = Array.new(@lines[0].length, 0)
    
    @lines.each do |line| 
      nums = line.split("").map {|s| s.to_i}
      bit_counts = bit_counts.zip(nums).map {|a, b| a + b}
    end
          
    gamma = bit_counts.map {|count| count >= @lines.length/2? 1 : 0}.join.to_i(2)
    epsilon = bit_counts.map {|count| count < @lines.length/2? 1 : 0}.join.to_i(2)
    
    gamma * epsilon
  end
  
  def parttwo
    nums = @lines.map {|line| line.split("").map {|s| s.to_i}}

    a = rating(nums, 1)
    b = rating(nums, 2)
    
    a * b
  end
  
  def rating(nums, type)
    # janky solution, loop over numbers, discarding invalid ones as we go
    nums_rating = nums.clone
    for i in 0..@lines[0].length - 1
      # count bits as in part one
      bit_counts = Array.new(@lines[0].length, 0)
    
      nums_rating.each do |num| 
        bit_counts = bit_counts.zip(num).map {|a, b| a.to_i + b.to_i}
      end

      gamma = bit_counts.map {|count| count >= (nums_rating.length/2 + nums_rating.length % 2)? "1" : "0"}
      
      # map bit to replace into comparison array
      bit = gamma[i]
      comp = nums_rating.map do |num| 
        num.map.with_index do |n, index|
          if index == i
            bit
          else
            n.to_s
          end
        end
      end
      
      # rating type, different comparison, perform a xor to check if bit is in number
      if type == 1
        nums_rating = nums_rating.zip(comp).select{|a,b| a.join.to_i(2) ^ b.join.to_i(2) == 0}.map(&:first)
      else
        nums_rating = nums_rating.zip(comp).select{|a,b| a.join.to_i(2) ^ b.join.to_i(2) > 0}.map(&:first)
      end
      
      break if nums_rating.length == 1
    end
    
    nums_rating.join.to_i(2)
  end
end