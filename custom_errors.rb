module CustomErrors
  class PlaceRobot < StandardError
    def initialize(msg = 'You should first place robot on the table.')
      super
    end
  end

  class RobotWillFallDown < StandardError
    def initialize(msg = 'The robot going to fall down. We did not move the robot anywhere.')
      super
    end
  end

  class MustBeImplemented < StandardError
    def initialize(msg = 'This method must be implemented.')
      super
    end
  end

  class InvalidFaceDirection < StandardError
    def initialize(msg = 'Invalid face direction. Available directions are NORTH,EAST,SOUTH,WEST')
      super
    end
  end

  class PlaceCommandMissingArgs < StandardError
    def initialize(msg = 'PLACE command requires 3 args. x, y, f')
      super
    end
  end

  class InvalidCommand < StandardError
    def initialize(msg = 'Invalid command. Available commands ara PLACE, MOVE, LEFT, RIGHT and REPORT.')
      super
    end
  end

  class InvalidPlanePosition < StandardError
    def initialize(msg = 'Invalid plane position.')
      super
    end
  end
end