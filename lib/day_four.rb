require_relative "day"

class DayFour < Day
  def partone
    # first line is input
    input = @lines[0].split(",").map {|s| s.to_i}
    @lines.delete_at(0)
    
    # create boards
    boards = @lines.map {|line| line.split.map {|s| s.to_i}}.reject {|arr| arr.empty? }.each_slice(5).to_a
    
    score = 0
    input.each do |drawn_number|
      # place number on board then check result
      boards = boards.map do |board|
        board.map {|row| row.map {|n| (n == drawn_number)? -1 : n}} 
      end
      results = check_wins(boards)
      if !results.empty?
        # compute score by summing then multiplying by winning number
        score = results[0].map {|row| row.map {|n| (n == -1)? 0 : n}.reduce(:+)}.reduce(:+) * drawn_number
        break
      end
    end
    
    score
  end

  def parttwo
    # first line is input
    input = @lines[0].split(",").map {|s| s.to_i}
    @lines.delete_at(0)
    
    # create boards
    boards = @lines.map {|line| line.split.map {|s| s.to_i}}.reject {|arr| arr.empty? }.each_slice(5).to_a
    
    num_boards = boards.length
    
    score = 0
    results = []
    input.each do |drawn_number|
      # place number on board then check result
      boards = boards.map do |board|
        board.map {|row| row.map {|n| (n == drawn_number)? -1 : n}} 
      end
      results = check_wins(boards)
      results.each do |result|
        boards.delete(result)
      end
      # we just removed the last element, so thats the final winning board
      if boards.length == 0
        score = results[-1].map {|row| row.map {|n| (n == -1)? 0 : n}.reduce(:+)}.reduce(:+) * drawn_number
        break
      end
    end
    
    score
  end
    
  def check_wins(boards)
    # return set of winning boards rather than just one
    winning_boards = []
    boards.each do |board|
      # check rows
      board.each do |row|
        # return board if row.uniq.count == 1
        if row.uniq.count == 1
          winning_boards.append(board) 
          break
        end
      end
      # and columns
      board.transpose.each do |col|
        if col.uniq.count == 1
          winning_boards.append(board) 
          break
        end
      end
    end
    winning_boards.uniq
  end
  
end

class Board
  
end