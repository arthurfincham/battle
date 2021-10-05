require 'player'

describe Player do
  subject { described_class.new("Arthur")}
  
  it 'has a name' do
    expect(subject.name).to eq "Arthur"
  end
end