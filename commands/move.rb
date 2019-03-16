module Commands
  class Move < Base
    def execute
      @robot.move_forward
    end
  end

  Commands::Base.register_command(Commands::Move.identifier, Commands::Move)
end
