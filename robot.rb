class Robot
  attr_accessor :position

  def initialize
    @position = Position.new(Table.new)
  end

  def move_forward
    send("move_forward_on_#{@position.f.plane_position}")
  end

  def turn_left
    @position.f = @position.f.left
  end

  def turn_right
    @position.f = @position.f.right
  end

  private

  def move_forward_on_x
    @position.x = @position.x + @position.f.forward
  end

  def move_forward_on_y
    @position.y = @position.y + @position.f.forward
  end
end