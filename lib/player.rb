class Player
  attr_reader :name
  attr_accessor :health_points
  
  DEFAULT_HP = 50

  def initialize(name)
    @name = name
    @health_points = DEFAULT_HP
  end

  def attack(player, technique)
    player.take_damage(technique)
  end

  def take_damage(technique)
    @health_points -= random_damage_amount(technique)
  end

  private

  def random_damage_amount(technique)
    if 'head_kick'
      10
    elsif 'body_kick'
      6
    elsif 'upper_cut'
      8
    else
      4
    end
  end
end