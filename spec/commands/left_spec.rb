describe Commands::Left do

  it 'not registered as a command' do
    klass = Commands::Base

    expect(klass::REGISTERED_COMMANDS.keys).to include('LEFT')
  end

  it 'has invalid identifier' do
    klass = Commands::Left

    expect(klass.identifier).to eq('LEFT')
  end

  it 'does not turn the robot left' do
    robot = Robot.new

    Commands::Place.new(robot, %w[1 1 NORTH]).execute

    Commands::Left.new(robot).execute

    expect(robot.position.f).to eq(Directions::WEST)
  end
end