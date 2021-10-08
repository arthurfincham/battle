class Technique
  attr_reader :move

  def initialize(move)
    @move = move
  end

  def self.create(move)
    @technique = Technique.new(move)
  end

  def self.instance
    @technique
  end

end