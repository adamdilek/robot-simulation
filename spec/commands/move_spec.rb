describe Commands::Move do

  it 'not registered as a command' do
    klass = Commands::Base

    expect(klass::REGISTERED_COMMANDS.keys).to include('MOVE')
  end

  it 'has invalid identifier' do
    klass = Commands::Move

    expect(klass.identifier).to eq('MOVE')
  end

  it 'does not move forward robot' do
    robot = Robot.new

    Commands::Place.new(robot, %w[1 1 NORTH]).execute

    Commands::Move.new(robot).execute

    expect(robot.position.y).to eq(2)
    expect(robot.position.x).to eq(1)
    expect(robot.position.f).to eq(Directions::NORTH)
  end
end