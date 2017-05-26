


=begin



end


  def check_win
    if @hint.include?("_") == false
      #print "\nyou win!!!"
      exit
    else
      #print "\nGuess another letter"
      @letter = gets.chomp.downcase
      check_guess
    end
  end



  def save_game
    print "\nDo you want to save the game and exit? Type Y or N"
    @save = gets.chomp.upcase

    if @save == "Y"
      File.open("savedgame.yaml", "w") do |file|
        file.write(YAML::dump(self))
        exit
      end
    elsif @save == "N"
      check_win
    else
      #print "\nInput not understood. please type Y or N"
      save_game
    end
  end

  def load_game
    #print "\nWould you like to load a previously saved game? Type Y or N\n"
    @prevgame = gets.chomp.upcase

    if @prevgame == "Y"
      saved_file = YAML::load(File.read("savedgame.yaml"))
      #print "\nYour game is loaded!"
      savedFile.check_guess
    elsif @prevgame == "N"
      start_game
    else
      #print "\nInput not understood. please type Y or N"
      load_game
    end
=end

end
