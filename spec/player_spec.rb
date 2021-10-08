require 'player'

describe Player do
  subject(:subject){ described_class.new("Arthur")}


  describe '#name' do
    it 'has a name' do
      expect(subject.name).to eq "Arthur"
    end
  end

  describe '#health_points' do
    it 'returns health points' do
      expect(subject.health_points).to eq described_class::DEFAULT_HP
    end
  end

  describe '#taking damage' do
    it 'head kick takes 15 HP' do
      expect { subject.take_damage('head_kick') }.to change { subject.health_points }.by(-15)
    end

    it 'body kick takes 8 HP' do
      expect { subject.take_damage('body_kick') }.to change { subject.health_points }.by(-8)
    end

    it 'upper cut takes 10 HP' do
      expect { subject.take_damage('upper_cut') }.to change { subject.health_points }.by(-10)
    end

    it 'right hook takes 5 HP' do
      expect { subject.take_damage('right_hook') }.to change { subject.health_points }.by(-5)
    end

    it 'anything else throws an error' do
      expect { subject.take_damage('randomthing') }.to raise_error("There has been a problem with submitting your technique.")
    end
  end
end