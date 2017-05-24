class Knight
  attr_accessor :position, :possible_moves, :board, :previous_spot

  def initialize(start=nil)
    @position = start
    @previous_spot = nil
    @board = create_board
    @possible_moves = new_moves(position = [0,0])
  end

  def create_board
    board = []
    8.times do |x|
      8.times do |y|
        board << [x,y]
      end
    end
  end
# make list of all possible moves
  def new_moves(start)
    moves = []
    possible_moves = [[1,2], [1,-2], [2,1], [-2,1], [2,-1], [-2,-1], [-1,2], [-1,-2]]
    possible_moves.each do |i|
      next_move = [start[0] + i[0], start[1] + i[1]]
      if location_valid?(next_move)
        moves.push(next_move)
      end
    end
    return moves
  end
# check if these possible moves are on the board
  def location_valid?(location)
    if location[0] >= 0 && location[0] <= 7 && location[1] >= 0 && location[1] <= 7
      return true
    else
      return false
    end
  end

  def knight_moves(start, end)
    if !location_valid?(start) || !location_valid?(end)
      puts "positions are not valid"
    else
      knight = Knight.new(start)
      moves = [knight]
      until moves[0].position == end
        prev_move = moves.shift
        new_moves(prev_move.position).each do |move|
          knight = Knight.new(move)
          knight.previous_spot = prev_move
          moves << knight
        end
      end
      current_knight = moves[0]
      path = []
      until current_knight.previous_spot == nil
        path.unshift(current_knight.position)
        current_knight = current_knight.previous_spot
      end
      path.unshift(current_knight.position)
      puts "The shortest path from #{start} to #{end} is "
      path.each do |x|
        print x.to_s + " "
      end
      puts
    end
  end
end

x = Knight.new
num1 = rand(7)
num2 = rand(7)
num3 = rand(7)
num4 = rand(7)

x.knight_moves([num1,num2],[num3,num4])
x.knight_moves([num4,num1],[num2,num3])
x.knight_moves([num2,num3],[num4,num1])
x.knight_moves([num3,num4],[num1,num2])

# [[0, 0], [0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [0, 7],
#  [1, 0], [1, 1], [1, 2], [1, 3], [1, 4], [1, 5], [1, 6], [1, 7],
#  [2, 0], [2, 1], [2, 2], [2, 3], [2, 4], [2, 5], [2, 6], [2, 7],
#  [3, 0], [3, 1], [3, 2], [3, 3], [3, 4], [3, 5], [3, 6], [3, 7],
#  [4, 0], [4, 1], [4, 2], [4, 3], [4, 4], [4, 5], [4, 6], [4, 7],
#  [5, 0], [5, 1], [5, 2], [5, 3], [5, 4], [5, 5], [5, 6], [5, 7],
#  [6, 0], [6, 1], [6, 2], [6, 3], [6, 4], [6, 5], [6, 6], [6, 7],
#  [7, 0], [7, 1], [7, 2], [7, 3], [7, 4], [7, 5], [7, 6], [7, 7]]
