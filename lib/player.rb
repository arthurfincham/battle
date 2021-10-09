class Player
  attr_reader :name, :take_damage
  attr_accessor :health_points
  
  DEFAULT_HP = 50

  def initialize(name)
    @name = name
    @health_points = DEFAULT_HP
  end

  def take_damage(technique)
    @health_points -= random_damage_amount(technique)
  end

  private

  def random_damage_amount(technique)
    case technique
    when "head_kick"
      15
    when "body_kick" 
      8
    when "upper_cut" 
      10
    when "right_hook"
      5
    when "tek_for_testing"
      50
    else
      raise("There has been a problem with submitting your technique.")
    end
  end
end