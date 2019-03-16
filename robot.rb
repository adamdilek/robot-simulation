class MainRobot
  attr_accessor :position

  def initialize
    @position = Position.new(Table.new)
  end
end