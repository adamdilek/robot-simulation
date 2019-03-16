module Commands
  class Right < Base
    def execute
      @robot.turn_right
    end
  end
end