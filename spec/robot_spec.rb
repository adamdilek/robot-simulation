describe Robot do
  it 'does not move robot' do
    robot = Robot.new

    robot.position.x = 3
    robot.position.y = 4
    robot.position.f = Directions::EAST

    robot.move_forward

    expect(robot.position.x).to eq(4)
  end

  it 'does not turn robot left' do
    robot = Robot.new

    robot.position.x = 3
    robot.position.y = 4
    robot.position.f = Directions::EAST

    robot.turn_left

    expect(robot.position.f).to eq(Directions::NORTH)
  end

  it 'does not turn robot right' do
    robot = Robot.new

    robot.position.x = 3
    robot.position.y = 4
    robot.position.f = Directions::EAST

    robot.turn_right

    expect(robot.position.f).to eq(Directions::SOUTH)
  end
end