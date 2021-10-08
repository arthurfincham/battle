class Game
  attr_reader :current_turn, :players, :attack

  def initialize(player1, player2)
    @players = [player1, player2]
    @current_turn = player1
  end

  def self.create(player1, player2)
    @game = Game.new(player1, player2)
  end

  def self.instance
    @game
  end
  
  def player1
    @players.first
  end
  
  def player2
    @players.last
  end
  
  def attack(player, technique)
    player.take_damage(technique)
  end
  
  def switch_turns
    @current_turn = opponent_of(current_turn)
  end
  
  def opponent_of(a_player)
    @players.select { |player| player != a_player }.first
  end

  def game_over?
    losing_players.any?
  end

  def loser
    losing_players.first
  end

  private
  
  attr_reader :losing_players

  def losing_players
    players.select { |player| player.health_points <= 0 }
  end
end