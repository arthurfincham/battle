require 'sinatra'
require 'sinatra/reloader' if development?
require './lib/player.rb'
require './lib/game.rb'

class Battle < Sinatra::Base
  enable :sessions

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb(:index)
  end

  post '/names' do
    player1 = Player.new(params[:player1])
    player2 = Player.new(params[:player2])
    $game = Game.new(player1, player2)
    redirect '/play'
  end

  get '/play' do
    @game = $game
    erb(:play)
  end

  post '/attack' do
    # Attack.run($game.opponent_of($game.current_turn))
    if $game.game_over?
      redirect '/game-over'
    else
      redirect '/attack'
    end
  end

  get '/attack' do
    @game = $game
    @game.attack(@game.opponent_of(@game.current_turn))
    erb(:attack)
  end

  get '/game-over' do
    @game = $game
    erb :game_over
  end

  post '/switch-turns' do
    $game.switch_turns
    redirect '/play'
  end


  run! if app_file == $0
end