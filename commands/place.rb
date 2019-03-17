module Commands
  class Place < Base
    def validate_args
      raise CustomErrors::PlaceCommandMissingArgs unless @args.size == 3
      raise CustomErrors::InvalidFaceDirection if Position::DIRECTIONS[@args[2]].nil?
    end

    def execute
      old_position = @robot.position.dup

      @robot.position.x = @args[0]
      @robot.position.y = @args[1]
      @robot.position.f = Position::DIRECTIONS[@args[2]]
    rescue StandardError => ex
      @robot.position = old_position
      raise ex
    end
  end

  Commands::Base.register_command(Commands::Place.identifier, Commands::Place)
end
