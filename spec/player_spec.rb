require 'player'

describe Player do
  subject(:arthur){ described_class.new("Arthur")}
  subject(:tom){ described_class.new("Tom")}
  
  describe '#name' do
    it 'has a name' do
      expect(arthur.name).to eq "Arthur"
    end
  end

  describe '#health_points' do
    it 'returns health points' do
      expect(arthur.health_points).to eq described_class::DEFAULT_HP
    end
  end

  describe '#attack' do

    it 'reduces the players health points' do
      allow(Kernel).to receive(:rand).and_return(10)
      expect { arthur.take_damage }.to change { arthur.health_points }.by(-10)
    end
  end
end