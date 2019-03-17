describe Commands::Right do
  it 'not registered as a command' do
    klass = Commands::Base

    expect(klass::REGISTERED_COMMANDS.keys).to include('RIGHT')
  end

  it 'has invalid identifier' do
    klass = Commands::Right

    expect(klass.identifier).to eq('RIGHT')
  end

  it 'does not turn the robot right' do
    robot = Robot.new

    Commands::Place.new(robot, %w[1 1 NORTH]).execute

    Commands::Right.new(robot).execute

    expect(robot.position.f).to eq(Directions::EAST)
  end
end