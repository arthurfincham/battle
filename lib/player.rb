class Player
  attr_reader :name
  attr_accessor :health_points
  
  DEFAULT_HP = 50

  def initialize(name)
    @name = name
    @health_points = DEFAULT_HP
  end

  def attack(player)
    player.take_damage
  end

  def take_damage
    @health_points -= 10
  end
end