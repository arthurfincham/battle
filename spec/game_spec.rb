require 'game'

describe Game do

  let(:player1){ double :player }
  let(:player2){ double :player }
  
  describe "#attack" do
    it 'damages the player' do
      expect(player2).to receive(:take_damage)
      subject.attack(player2)
    end
  end
end