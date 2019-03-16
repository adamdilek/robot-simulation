module Commands
  class Place < Base
    def validate_args
      raise CustomErrors::PlaceCommandMissingArgs unless @args.size == 3
    end

    def execute
      old_position = @robot.position

      @robot.position.x = @args[0]
      @robot.position.y = @args[1]
      @robot.position.f = @args[2]
    rescue StandardError => ex
      @robot.position = old_position
      raise ex
    end
  end
end