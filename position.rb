Dir[File.join(__dir__, './positions/facing/', '*.rb')].each { |file| require file }

class Position
  attr_accessor :x, :y, :f

  FACING_POSITIONS = {}

  def initialize(table = Table.new)
    @table = table
  end

  def x=(value)
    value = value.to_i

    raise CustomErrors::RobotWillFallDown unless value >= 0 && value < @table.y

    @x = value
  end

  def y=(value)
    value = value.to_i

    raise CustomErrors::RobotWillFallDown unless value >= 0 && value < @table.y

    @y = value
  end

  def f=(value)
    raise CustomErrors::InvalidFacePosition if value.nil?

    raise CustomErrors::InvalidFacePosition unless FACING_POSITIONS.map{ |_k,v| v }.include?(value)

    @f = value
  end

  def self.register_position(position, klass)
    FACING_POSITIONS[position] = klass
  end
end