module Commands
  class Right < Base
    def execute
      case @robot.position.f
      when 'NORTH'
        @robot.position.f = 'EAST'
      when 'EAST'
        @robot.position.f = 'SOUTH'
      when 'SOUTH'
        @robot.position.f = 'WEST'
      when 'WEST'
        @robot.position.f = 'NORTH'
      else
        raise CustomErrors::InvalidFacePosition
      end
    end
  end
end