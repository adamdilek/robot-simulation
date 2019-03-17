describe Directions::NORTH do
  it 'has invalid identifier' do
    klass = Directions::NORTH

    expect(klass.identifier).to eq('NORTH')
  end

  it 'has invalid right direction' do
    klass = Directions::NORTH

    expect(klass.right).to eq(Directions::EAST)
  end

  it 'has invalid left direction' do
    klass = Directions::NORTH

    expect(klass.left).to eq(Directions::WEST)
  end
end