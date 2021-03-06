require 'game'

describe Game do
  subject(:game) { described_class.new(player1, player2) }
  subject(:finished_game) { described_class.new(dead_player, player2) }
  let(:player1){ double :player, health_points: 50 }
  let(:player2){ double :player, health_points: 50 }
  let(:dead_player) { double :player, health_points: 0 }
  let(:technique){ double :technique }
  
  describe "#attack" do
    it 'damages the player' do
      expect(subject.player2).to receive(:take_damage)
      subject.attack(subject.player2, technique)
    end
  end

  describe '#player1' do
    it 'retrieves the first player' do
      expect(game.player1).to eq player1
    end
  end

  describe '#player2' do
    it 'retrieves the second player' do
      expect(game.player2).to eq player2
    end
  end

  describe '#current_turn' do
    it 'starts as player 1' do
      expect(game.current_turn).to eq player1
    end
  end

  describe '#switch_turns' do
    it 'switches the turn' do
      game.switch_turns
      expect(game.current_turn).to eq player2
    end
  end

  describe '#opponent_of' do
     it 'finds the opponent of a player' do
       expect(game.opponent_of(player1)).to eq player2
       expect(game.opponent_of(player2)).to eq player1
     end
   end

   describe "#game_over?" do
    it 'returns false if both players have more than 0HP' do
      expect(game.game_over?).to be false
    end

    it 'returns true if one player has 0HP' do
      expect(finished_game.game_over?).to be true
    end
   end

   describe '#loser' do
    it 'returns the player on less than 0HP' do
      expect(finished_game.loser).to eq dead_player
    end
   end
end