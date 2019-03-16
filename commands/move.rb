module Commands
  class Move < Base
    def execute
      case @robot.position.f
      when 'NORTH'
        @robot.position.y = @robot.position.y + 1
      when 'WEST'
        @robot.position.x = @robot.position.x - 1
      when 'EAST'
        @robot.position.x = @robot.position.x + 1
      when 'SOUTH'
        @robot.position.y = @robot.position.y - 1
      else
        raise CustomErrors::InvalidFacePosition
      end
    end
  end
end