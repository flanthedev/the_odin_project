require "yaml"
require "sinatra"
require "sinatra/reloader" if development?

enable :sessions

get "/" do
  new_game
  update_session
  erb :index
end

post "/" do
  check_guess
  game_over?
  update_session
  erb :index
end


helpers do

  def update_session
    @guessed = session[:guessed]
    @wrong_guesses = session[:wrong_guesses]
    @win = session[:win]
    @lose = session[:lose]
    @hint = session[:hint]
    @word = session[:word]

    if @win
      @message = "you won! the word was #{@word}. play again, smartie pants?"
    end
    if @lose
      @message = "you lost, sorry. the word was #{@word}. play again?"
    end

    if @win || @lose
      session[:word] = nil
    end
  end

  def new_game
    word = ""
    while (word.size < 5 || word.size > 12) do
      word = File.readlines("/home/chris/projects/the_odin_project/hangman_sinatra/5text.txt").sample.to_s.chomp
    end
    @word = word

    @message = "take a guess!"
    session[:message] = @message
    session[:word] = @word.upcase
    session[:guessed] = []
    session[:wrong_guesses] = 0
    session[:win] = false
    session[:lose] = false
    session[:hint] = "_" * @word.size
  end

  def check_guess
    if (params["guess"].size!=1 || params["guess"]>'z' || params["guess"]<'A')
      @message = "invalid input. try again!"
    elsif (session[:guessed].include? (params["guess"].upcase))
      @message = "you already guessed that letter, silly!"
    else
      session[:guessed] << params["guess"].upcase
      if !session[:word].include? params["guess"].upcase
        session[:wrong_guesses] += 1
        @message = "wrong, sorry!"
      else
        word_array = session[:word].split(//)
        word_array.size.times do |i|
          if word_array[i] == params["guess"].upcase
            session[:hint][i] = word_array[i]
            @message = "you guessed correctly. wow!"
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
