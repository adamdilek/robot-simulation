describe Directions::WEST do
  it 'has invalid identifier' do
    klass = Directions::WEST

    expect(klass.identifier).to eq('WEST')
  end

  it 'has invalid right direction' do
    klass = Directions::WEST

    expect(klass.right).to eq(Directions::NORTH)
  end

  it 'has invalid left direction' do
    klass = Directions::WEST

    expect(klass.left).to eq(Directions::SOUTH)
  end
end