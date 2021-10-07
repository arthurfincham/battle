class Battle

  def self.create(player1, player2)
    @battle = Battle.new
  end

  def self.instance
    @battle
  end

end