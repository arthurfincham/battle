require 'sinatra'
require 'sinatra/reloader' if development?
require './lib/player.rb'
require './lib/game.rb'
require './lib/technique.rb'
require './lib/move.rb'

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
    @game = Game.create(player1, player2)
    redirect '/play'
  end

  before do
    @game = Game.instance
  end

  get '/play' do
    erb(:play)
  end

  post '/attack' do
    move = Move.new(params[:attack_type])
    @technique = Technique.create(move)
    if @game.game_over?
      redirect '/game-over'
    else
      redirect '/attack'
    end
  end

  get '/attack' do
    @technique = Technique.instance
    @game.attack(@game.opponent_of(@game.current_turn), @technique)
    erb(:attack)
  end

  get '/game-over' do
    erb :game_over
  end

  post '/switch-turns' do
    @game.switch_turns
    redirect '/play'
  end


  run! if app_file == $0
end