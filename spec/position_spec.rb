describe Position do
  it 'accepts invalid x value' do
    table = Table.new(5,5)

    position = Position.new(table)

    expect { position.x = 10 }.to raise_error(CustomErrors::RobotWillFallDown)
  end

  it 'does not set valid x value' do
    table = Table.new(5,5)

    position = Position.new(table)

    position.x = 1

    expect(position.x).to eq(position.x)
  end

  it 'accepts invalid y value' do
    table = Table.new(5,5)

    position = Position.new(table)

    expect { position.y = 10 }.to raise_error(CustomErrors::RobotWillFallDown)
  end

  it 'does not set valid y value' do
    table = Table.new(5,5)

    position = Position.new(table)

    position.y = 4

    expect(position.y).to eq(position.y)
  end

  it 'accepts invalid f value' do
    table = Table.new(5,5)

    position = Position.new(table)

    expect { position.f = 10 }.to raise_error(CustomErrors::InvalidFaceDirection)
  end

  it 'does not accept valid f value' do
    table = Table.new(5,5)

    position = Position.new(table)

    position.f = Position::DIRECTIONS.first.last

    expect(position.f).to eq(Position::DIRECTIONS.first.last)
  end
end

