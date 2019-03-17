describe Directions::EAST do
  it 'has invalid identifier' do
    klass = Directions::EAST

    expect(klass.identifier).to eq('EAST')
  end

  it 'has invalid right direction' do
    klass = Directions::EAST

    expect(klass.right).to eq(Directions::SOUTH)
  end

  it 'has invalid left direction' do
    klass = Directions::EAST

    expect(klass.left).to eq(Directions::NORTH)
  end
end