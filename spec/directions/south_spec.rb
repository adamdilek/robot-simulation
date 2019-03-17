describe Directions::SOUTH do
  it 'has invalid identifier' do
    klass = Directions::SOUTH

    expect(klass.identifier).to eq('SOUTH')
  end

  it 'has invalid right direction' do
    klass = Directions::SOUTH

    expect(klass.right).to eq(Directions::WEST)
  end

  it 'has invalid left direction' do
    klass = Directions::SOUTH

    expect(klass.left).to eq(Directions::EAST)
  end
end