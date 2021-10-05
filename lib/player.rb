class Player
  attr_reader :name
  attr_accessor :health_points
  
  def initialize(name)
    @name = name
    @health_points = 50
  end
end