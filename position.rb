Dir[File.join(__dir__, './positions/facing/', '*.rb')].each { |file| require file }

class Position
  attr_accessor :x, :y, :f

  DIRECTIONS = {}

  def initialize(table)
    raise StandardError, 'Invalid table class' unless table.is_a?(Table)

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
    raise CustomErrors::InvalidFaceDirection if value.nil?

    raise CustomErrors::InvalidFaceDirection unless DIRECTIONS.map(&:last).include?(value)

    @f = value
  end

  def self.register_direction(direction, klass)
    DIRECTIONS[direction] = klass if klass.superclass == Directions::Base
  end
end