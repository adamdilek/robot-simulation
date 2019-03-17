describe Commander do
  it 'does not raise an error when got invalid command' do
    robot = Robot.new

    commander = Commander.new(robot, ['INVALID'])

    expect { commander.run }.to raise_error(CustomErrors::InvalidCommand)
  end

  it 'does not execute command' do
    robot = Robot.new

    commander = Commander.new(robot, ['PLACE', 1, 1, 'NORTH'])

    commander.run

    expect(robot.position.x).to eq(1)
  end
end