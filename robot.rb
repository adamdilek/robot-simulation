class Robot
  attr_accessor :position

  def initialize
    @position = Position.new(Table.new)
  end

  def move_forward

    # new_value = @position.send(@position.f.plane_position) + @position.f.forward
    #
    # puts new_value
    #
    # @position.instance_variable_set("@#{@position.f.plane_position}", new_value)

    if @position.f.plane_position == 'x'
      @position.x = @position.x + @position.f.forward
    end

    if @position.f.plane_position == 'y'
      @position.y = @position.y + @position.f.forward
    end
  end

  def turn_left
    @position.f = @position.f.left
  end

  def turn_right
    @position.f = @position.f.right
  end
end