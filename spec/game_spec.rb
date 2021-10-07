require 'game'

describe Game do
  subject(:game) { described_class.new(player1, player2) }
  let(:player1){ double :player }
  let(:player2){ double :player }
  
  describe "#attack" do
    it 'damages the player' do
      expect(subject.player2).to receive(:take_damage)
      subject.attack(subject.player2)
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
      expect(game.current_turn).to eq player_1
    end
  end

  describe '#switch_turns' do
    it 'switches the turn' do
      game.switch_turns
      expect(game.current_turn).to eq player_2
    end
  end
end