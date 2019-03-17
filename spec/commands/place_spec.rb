describe Commands::Place do
  it 'not registered as a command' do
    klass = Commands::Base

    expect(klass::REGISTERED_COMMANDS.keys).to include('PLACE')
  end

  it 'has invalid identifier' do
    klass = Commands::Place

    expect(klass.identifier).to eq('PLACE')
  end

  it 'accepts missing args' do
    robot = Robot.new

    expect { Commands::Place.new(robot, %w[1 1]) }.to raise_error(CustomErrors::PlaceCommandMissingArgs)
  end

  it 'accepts invalid face direction' do
    robot = Robot.new

    expect { Commands::Place.new(robot, %w[1 1 invalid]) }.to raise_error(CustomErrors::InvalidFaceDirection)
  end

  it 'does not place robot' do
    robot = Robot.new

    command = Commands::Place.new(robot, %w[1 1 NORTH])

    command.execute

    expect(robot.position.x).to eq(1)
    expect(robot.position.y).to eq(1)
    expect(robot.position.f).to eq(Directions::NORTH)
  end

  it 'place robot in invalid position' do
    robot = Robot.new

    command = Commands::Place.new(robot, %w[11 11 NORTH])

    expect { command.execute }.to raise_error(CustomErrors::RobotWillFallDown)
  end

  it 'does not replace robot when got invalid arguments' do
    robot = Robot.new

    Commands::Place.new(robot, %w[1 1 NORTH]).execute

    begin
      Commands::Place.new(robot, %w[10 1 NORTH])
    rescue => ex
    end

    expect(robot.position.x).to eq(1)
    expect(robot.position.y).to eq(1)
    expect(robot.position.f).to eq(Directions::NORTH)
  end
end