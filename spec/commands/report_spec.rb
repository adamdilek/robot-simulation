describe Commands::Report do
  it 'not registered as a command' do
    klass = Commands::Base

    expect(klass::REGISTERED_COMMANDS.keys).to include('REPORT')
  end

  it 'has invalid identifier' do
    klass = Commands::Report

    expect(klass.identifier).to eq('REPORT')
  end

  it 'does not returns right position' do
    robot = Robot.new

    Commands::Place.new(robot, %w[1 1 NORTH]).execute

    expect(Commands::Report.new(robot).execute).to eq('Output: 1, 1, NORTH')
  end
end