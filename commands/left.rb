module Commands
  class Left < Base
    def execute
      @robot.turn_left
    end
  end
end
