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
    $player1 = Player.new(params[:player1])
    $player2 = Player.new(params[:player2])
    redirect '/play'
  end

  get '/play' do
    @player1 = $player1
    @player2 = $player2
    @player1_hp = $player1.health_points
    @player2_hp = $player2.health_points
    erb(:play)
  end

  get '/attack' do
    @player1 = $player1
    @player2 = $player2
    Game.new.attack(@player2)
    erb(:attack)
  end


  run! if app_file == $0
end