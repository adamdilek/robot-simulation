module Commands
  class Move < Base
    def execute
      @robot.move_forward
    end
  end
end
