require "sinatra"
require "sinatra/reloader" if development?

enable :sessions

get '/' do
  start_session
  erb :index
end

get '/box1' do
  update
  move
  check_win
  erb :index
end

get '/box2' do
  update
  move
  check_win
  erb :index
end

get '/box3' do
  update
  move
  check_win
  erb :index
end

get '/box4' do
  update
  move
  check_win
  erb :index
end

get '/box5' do
  update
  move
  check_win
  erb :index
end

get '/box6' do
  update
  move
  check_win
  erb :index
end

get '/box7' do
  update
  move
  check_win
  erb :index
end

get '/box8' do
  update
  move
  check_win
  erb :index
end

get '/box9' do
  update
  move
  check_win
  erb :index
end

helpers do

  def start_session
    session[:s1] = 0
    @s1 = session[:s1]
    session[:s2] = 0
    @s2 = session[:s2]
    session[:s3] = 0
    @s3 = session[:s3]
    session[:s4] = 0
    @s4 = session[:s4]
    session[:s5] = 0
    @s5 = session[:s5]
    session[:s6] = 0
    @s6 = session[:s6]
    session[:s7] = 0
    @s7 = session[:s7]
    session[:s8] = 0
    @s8 = session[:s8]
    session[:s9] = 0
    @s9 = session[:s9]

    @turn = 1
    session[:turn] = @turn
    @win = false
    session[:win] = @win

    @message = "player 1's turn"
  end


  def update
    @turn = session[:turn]
    @message = session[:message]
    @win = session[:win]
    @s1 = session[:s1]
    @s2 = session[:s2]
    @s3 = session[:s3]
    @s4 = session[:s4]
    @s5 = session[:s5]
    @s6 = session[:s6]
    @s7 = session[:s7]
    @s8 = session[:s8]
    @s9 = session[:s9]
  end


  def move
    #player 2 has even turns
    if session[:turn].even? && session[:turn] != 0
      if params['box1'] && @s1 != 1
        @s1 = 2
      elsif params['box2'] && @s2 != 1
        @s2 = 2
      elsif params['box3'] && @s3 != 1
        @s3 = 2
      elsif params['box4'] && @s4 != 1
        @s4 = 2
      elsif params['box5'] && @s5 != 1
        @s5 = 2
      elsif params['box6'] && @s6 != 1
        @s6 = 2
      elsif params['box7'] && @s7 != 1
        @s7 = 2
      elsif params['box8'] && @s8 != 1
        @s8 = 2
      elsif params['box9'] && @s9 != 1
        @s9 = 2
      end
      @message = "player 1's turn"
    #player 1 has odd turns
    else
      if params['box1'] && @s1 != 2
        @s1 = 1
      elsif params['box2'] && @s2 != 2
        @s2 = 1
      elsif params['box3'] && @s3 != 2
        @s3 = 1
      elsif params['box4'] && @s4 != 2
        @s4 = 1
      elsif params['box5'] && @s5 != 2
        @s5 = 1
      elsif params['box6'] && @s6 != 2
        @s6 = 1
      elsif params['box7'] && @s7 != 2
        @s7 = 1
      elsif params['box8'] && @s8 != 2
        @s8 = 1
      elsif params['box9'] && @s9 != 2
        @s9 = 1
      end
      @message = "player 2's turn"
    end

    session[:s1] = @s1
    session[:s2] = @s2
    session[:s3] = @s3
    session[:s4] = @s4
    session[:s5] = @s5
    session[:s6] = @s6
    session[:s7] = @s7
    session[:s8] = @s8
    session[:s9] = @s9
    session[:win] = @win
    session[:message] = @message
    session[:turn] += 1
  end

  def check_win
    if (@s1 == 1 && @s2 == 1 && @s3 == 1) ||
      (@s4 == 1 && @s5 == 1 && @s6 == 1) ||
      (@s7 == 1 && @s8 == 1 && @s9 == 1) ||
      (@s1 == 1 && @s4 == 1 && @s7 == 1) ||
      (@s2 == 1 && @s5 == 1 && @s8 == 1) ||
      (@s3 == 1 && @s6 == 1 && @s9 == 1) ||
      (@s1 == 1 && @s5 == 1 && @s9 == 1) ||
      (@s3 == 1 && @s5 == 1 && @s7 == 1)
      @message = "player 1 wins!"
      @win = true
    elsif (@s1 == 2 && @s2 == 2 && @s3 == 2) ||
      (@s4 == 2 && @s5 == 2 && @s6 == 2) ||
      (@s7 == 2 && @s8 == 2 && @s9 == 2) ||
      (@s1 == 2 && @s4 == 2 && @s7 == 2) ||
      (@s2 == 2 && @s5 == 2 && @s8 == 2) ||
      (@s3 == 2 && @s6 == 2 && @s9 == 2) ||
      (@s1 == 2 && @s5 == 2 && @s9 == 2) ||
      (@s3 == 2 && @s5 == 2 && @s7 == 2)
      @message = "player 2 wins!"
      @win = true
    elsif session[:turn] >= 10
      @message = "it's a draw!"
      @win = true
    end
  end

end
