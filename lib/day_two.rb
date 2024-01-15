require_relative "day"

class DayTwo < Day
  def partone
    horiz = 0
    depth = 0
    @lines.each do |line|
      # check command
      cmd = line[0]
      val = line.split[1].to_i
      case cmd
      when "f"
        horiz += val
      when "d"
        depth += val
      when "u"
        depth -= val
      end
    end
    horiz * depth
  end
  
  def parttwo
    horiz = 0
    depth = 0
    aim = 0
    @lines.each do |line|
      # check command
      cmd = line[0]
      val = line.split[1].to_i
      case cmd
      when "f"
        horiz += val
        depth += aim * val
      when "d"
        aim += val
      when "u"
        aim -= val
      end
    end
    horiz * depth
  end

end