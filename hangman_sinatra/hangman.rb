require "yaml"
require "sinatra"
require "sinatra/reloader" if development?

enable :sessions

get "/" do
  @hint = "x"
  @wrong_letters = []
  @wrong_guesses = 0

  @intro = session[:intro]
  session[:intro] = true
  @message = "type a word to play with your friend (close your eyes, friend)"

  erb :index
end

post "/" do
  check_guess
  game_over?
  update_session
  erb :index
end

post '/cheat' do

  @hint = session[:hint]
  @wrong_letters = session[:wrong_letters]
  @wrong_guesses = session[:wrong_guesses]
  @word = session[:word]

  @cheat = true
  erb :index
end

get '/word_input' do
  update_session

  if params["word_input"] = params["word_input"][/[a-zA-Z]+{4,12}/]
    new_game_word_input
    update_session
  else
    @message = "please choose a word 4 to 12 letters long and no numbers, punctuation, or symbols."
    @intro = true
  end

  erb :index
end

get '/choose_word' do
  session[:intro] = true
  update_session
  @intro = session[:intro]
  @message = "type a word to play with your friend (close your eyes, friend)"

  erb :index
end

post '/random_word' do
  new_game
  update_session
  erb :index
end




helpers do

  def update_session
    @guessed = session[:guessed]
    @wrong_guesses = session[:wrong_guesses]
    @wrong_letters = session[:wrong_letters]
    @win = session[:win]
    @lose = session[:lose]
    @hint = session[:hint]
    @word = session[:word]
    @cheat = session[:cheat]

    win_responses = ["you won! the word was #{@word}. play again, smartie pants?", "victory!!! #{@word}!!! new game?", "such skill! #{@word} was the word. play again?"]
    lose_responses = ["you lost, sorry. the word was #{@word}. play again?", "defeat... the word was #{@word}. new game?", "better luck next time. the word was #{@word}. play again?"]
    @message = win_responses.sample if @win
    @message = lose_responses.sample if @lose
  end


  def new_game_word_input
      session[:intro] = false

      @word = (params["word_input"]).upcase
      session[:word] = @word
      begin_responses = ["let's play!", "your turn, friend!", "ok, take a guess!", "let's goooo!", "it's game time!", "game on!"]
      @message = begin_responses.sample

      session[:message] = @message
      session[:word] = @word.upcase
      session[:guessed] = []
      session[:wrong_guesses] = 0
      session[:wrong_letters] = []
      session[:win] = false
      session[:lose] = false
      session[:cheat] = false
      session[:hint] = "_" * @word.size

  end






  def new_game
    session["intro"] = false

    word = ""
    while (word.size < 5 || word.size > 12) do
      word = File.readlines("5text.txt").sample.to_s.chomp
    end
    @word = word

    begin_responses = ["let's play!", "your turn, friend!", "ok, take a guess!", "let's goooo!", "it's game time!", "game on!"]
    @message = begin_responses.sample

    session[:message] = @message
    session[:word] = @word.upcase
    session[:guessed] = []
    session[:wrong_guesses] = 0
    session[:wrong_letters] = []
    session[:win] = false
    session[:lose] = false
    session[:cheat] = false
    session[:hint] = "_" * @word.size
  end

  def check_guess
    correct_responses = ["you are inspirational", "breathtaking performance", "mark it down!", "you're like the Kobe of hangman", "you deserve a high-five", "dust that dirt off your shoulder", "hot as a kettle!", "whoop-deeee-doooo!", "you're soooo smart!", "good guess, Professor", "wow, you got it right!", "amazing guess!"]
    wrong_responses = ["atleast your mom loves you", "try, try again", "i believe in you! guess again.", "once more with passion!", "here we go again...", "ohhh snap :'(", "oops! wrong answer :-(", "sorry, try again!", "you're good at other things...", "please try again, for my sake", "you can do it! try again please!"]
    invalid_responses = ["invalid input. try again!", "try again with a letter", "gimme a letter!", "oops! :-/ invalid input", "once more with a new letter!", "i can only read letters", "letters pleeease, no symbols or numbers"]
    duplicate_guess_responses = ["you already guessed that letter, silly!", "try again with a new letter", "duplicate guess, pick another letter pleeease"]

    if (params["guess"].size != 1 || !params["guess"].upcase.between?('A','Z'))
      @message = invalid_responses.sample
    elsif (session[:guessed].include? (params["guess"].upcase))
      @message = duplicate_guess_responses.sample
    else
      session[:guessed] << params["guess"].upcase
      if !session[:word].include? params["guess"].upcase
        session[:wrong_letters] << params["guess"].upcase
        session[:wrong_guesses] += 1
        @message = wrong_responses.sample
      else
        word_array = session[:word].split(//)
        word_array.size.times do |i|
          if word_array[i] == params["guess"].upcase
            session[:hint][i] = word_array[i]
            @message = correct_responses.sample
          end
        end
      end
    end
  end

  def game_over?
    if session[:wrong_guesses] > 5
      session[:lose] = true
    else
      session[:win] = true
      session[:word].each_char do |i|
        if !session[:guessed].include? i
          session[:win] = false
        end
      end
    end
  end

end
