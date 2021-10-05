require 'sinatra'
require 'sinatra/reloader' if development?
require './lib/player.rb'

class Battle < Sinatra::Base
  enable :sessions

  configure :development do
    register Sinatra::Reloader
  end


  get '/' do
    erb(:index)
  end

  post '/names' do
    $player1_name = Player.new(params[:player1_name])
    $player2_name = Player.new(params[:player2_name])
    redirect '/play'
  end

  get '/play' do
    @player1_name = $player1_name.name
    @player2_name = $player2_name.name
    @player1_hp = $player1_name.health_points
    @player2_hp = $player2_name.health_points
    erb(:play)
  end

  get '/attack' do
    @player1_name = $player1_name.name
    @player2_name = $player2_name.name
    @player1_hp = $player1_name.health_points
    @player2_hp = $player2_name.health_points
    erb(:attack)
  end


  run! if app_file == $0
end