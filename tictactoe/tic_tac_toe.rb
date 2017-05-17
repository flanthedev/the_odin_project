class Game
# define the board
  def refresh_board
    puts "[#{@s1}] [#{@s2}] [#{@s3}] \n[#{@s4}] [#{@s5}] [#{@s6}] \n[#{@s7}] [#{@s8}] [#{@s9}]\n"
  end

  def board
    @s1 = 1
    @s2 = 2
    @s3 = 3
    @s4 = 4
    @s5 = 5
    @s6 = 6
    @s7 = 7
    @s8 = 8
    @s9 = 9
    refresh_board
  end

  def turn
    @i ||= -1
    @i += 1
  end

  def p1_move
    puts "/nPlayer 1, choose your move"
    move = gets.chomp.to_i
    if move == 1 && @s1 != "O"
      @s1 = "X"
    elsif move == 2 && @s2 != "0"
      @s2 = "X"
    elsif move == 3 && @s3 != "0"
      @s3 = "X"
    elsif move == 4 && @s4 != "0"
      @s4 = "X"
    elsif move == 5 && @s5 != "0"
      @s5 = "X"
    elsif move == 6 && @s6 != "0"
      @s6 = "X"
    elsif move == 7 && @s7 != "0"
      @s7 = "X"
    elsif move == 8 && @s8 != "0"
      @s8 = "X"
    elsif move == 9 && @s9 != "0"
      @s9 = "X"
    end
    turn
    check_win
    refresh_board
    p2_move
  end

  def p2_move
    puts "/nPlayer 2, choose your move"
    move = gets.chomp.to_i
    if move == 1 && @s1 != "X"
      @s1 = "O"
    elsif move == 2 && @s2 != "X"
      @s2 = "O"
    elsif move == 3 && @s3 != "X"
      @s3 = "O"
    elsif move == 4 && @s4 != "X"
      @s4 = "O"
    elsif move == 5 && @s5 != "X"
      @s5 = "O"
    elsif move == 6 && @s6 != "X"
      @s6 = "O"
    elsif move == 7 && @s7 != "X"
      @s7 = "O"
    elsif move == 8 && @s8 != "X"
      @s8 = "O"
    elsif move == 9 && @s9 != "X"
      @s9 = "O"
    end
    turn
    check_win
    refresh_board
    p1_move
  end

end

  def check_win
    @win = false
    if (@s1 == "X" && @s2 == "X" && @s3 == "X") ||
      (@s4 == "X" && @s5 == "X" && @s6 == "X") ||
      (@s7 == "X" && @s8 == "X" && @s9 == "X") ||
      (@s1 == "X" && @s4 == "X" && @s7 == "X") ||
      (@s2 == "X" && @s5 == "X" && @s8 == "X") ||
      (@s3 == "X" && @s6 == "X" && @s9 == "X") ||
      (@s1 == "X" && @s5 == "X" && @s9 == "X") ||
      (@s1 == "X" && @s5 == "X" && @s7 == "X")
      puts "Player 1 Wins!"
      @win = true
      refresh_board
      exit
    elsif (@s1 == "O" && @s2 == "O" && @s3 == "O") ||
      (@s4 == "O" && @s5 == "O" && @s6 == "O") ||
      (@s7 == "O" && @s8 == "O" && @s9 == "O") ||
      (@s1 == "O" && @s4 == "O" && @s7 == "O") ||
      (@s2 == "O" && @s5 == "O" && @s8 == "O") ||
      (@s3 == "O" && @s6 == "O" && @s9 == "O") ||
      (@s1 == "O" && @s5 == "O" && @s9 == "O") ||
      (@s1 == "O" && @s5 == "O" && @s7 == "O")
      puts "Player 2 Wins!"
      @win = true
      refresh_board
      exit
    elsif @i == 8 && @win == false
      puts "It's a draw"
      refresh_board
      exit
    end
  end

  a = Game.new
  a.board
  a.p1_move
