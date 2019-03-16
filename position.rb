class Position
  attr_accessor :x, :y, :f

  FACING_POSITIONS = %w[NORTH SOUTH EAST WEST].freeze

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
    raise CustomErrors::InvalidFacePosition unless Position::FACING_POSITIONS.include?(value)

    @f = value
  end

  def inspect
    "#{x} #{y} #{f}"
  end
end