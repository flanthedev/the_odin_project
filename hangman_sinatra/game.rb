require "yaml"
require "sinatra"
#require "sinatra/reloader" if development?

enable :sessions

get "/" do
  start_game
  start_session
  erb :index
end

post "/" do
  @guess = params['guess'].downcase

  #start_session
  @message = session[:message]
  erb :index
end

  def start_session
    @word = session[:word]
    @hint = session[:hint]
    @letter =  session[:letter]
    @wrong_letters = session[:wrong_letters]
    #@message = session[:message]
    @length = session[:length]
  end

  def start_game
    session[:word] = get_word
    #word_array = session[:word].split("")

    session[:hint] = make_hint
    session[:letter] = params['guess']
    session[:length] = session[:word].length

    session[:message] = "The hint is:"

    session[:wrong_letters] = []

    #check_guess
  end

  def get_word
    word = File.readlines("/home/chris/projects/the_odin_project/hangman_sinatra/5text.txt").sample.to_s.chomp
    if word.length >= 4 || word.length <= 12
      word
    else
      get_word
    end
    word
  end

  def make_hint
    Array.new(session[:word].length, "_")
  end

  def check_guess
    @index = @word_array.each_index.select do |i|
      @word_array[i] == @letter
    end

    if @index.empty? == true
      session[:wrong_letters] << @letter
      #turn
    else
      @index.map do |x|
        @hint[x] = @letter
      end
    end

    #print @hint.join(" ")
    #print "\nIncorrect guesses: #{wrong_letters}"
    #save_game
  end

  def turn
    @i ||= -1
    @i += 1

    if @i == 7
      session[:message] = "Game over! You lose!"
      #print "Game over! You lose!\n"
      #print @word_array.join()
    else
      #print "\nYou have #{7-@i} guesses left.\n"
    end
  end
