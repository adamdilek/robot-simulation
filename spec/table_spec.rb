describe Table do
  it 'does not have x value' do
    table = Table.new(5,5)

    expect(table.x).to eq(5)
  end

  it 'does not have y value' do
    table = Table.new(5,5)

    expect(table.y).to eq(5)
  end
end