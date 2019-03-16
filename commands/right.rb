module Commands
  class Right < Base
    def execute
      @robot.turn_right
    end
  end

  Commands::Base.register_command(Commands::Right.identifier, Commands::Right)
end
