class Hangman

  def get_word
    @word = File.readlines("5text.txt").sample.to_s.chomp
    if @word.length >= 4 || @word.length <= 12
      @word
    else
      get_word
    end
    @word
  end

  def start_game
    get_word
    puts @word
    @word_array = @word.split("")
    @length = @word.length
    @hint = Array.new(@length) { " _ " }
    @wrong_letters = []

    puts "Let's play a game of Hangman!\nYou have 8 chances to guess the word.\nThis is the hint: #{@hint}\nGuess a letter!"
    @letter = gets.chomp.downcase
    check_guess
  end

  def check_guess
    @index = @word_array.each_index.select do |i|
      @word_array[i] == @letter
    end

    if @index.empty? == true
      @wrongLetters.push(@letter)
      turn
    else
      @index.map do |x|
        @hint[x] = @letter
      end
    end

    print @hint.join(" ")
    print "\nIncorrect guesses: #{wrong_letters}"
    save_game
  end

  def check_win
    if @hint.include?("_") == false
      print "\nyou win!!!"
      exit
    else
      print "\nGuess another letter"
      @letter = gets.chomp.downcase
      check_guess
    end
  end

  def turn
    @i ||= -1
    @i += 1

    if @i == 7
      print "Game over! You lose!\n"
      print @word_array.join()
      exit
    else
      print "\nYou have #{7-@i} guesses left.\n"
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
      print "\nInput not understood. please type Y or N"
      save_game
    end
  end

  def load_game
    print "\nWould you like to load a previously saved game? Type Y or N\n"
    @prevgame = gets.chomp.upcase

    if @prevgame == "Y"
      saved_file = YAML::load(File.read("savedgame.yaml"))
      print "\nYour game is loaded!"
      savedFile.check_guess
    elsif @prevgame == "N"
      start_game
    else
      print "\nInput not understood. please type Y or N"
      load_game
    end
  end

end
