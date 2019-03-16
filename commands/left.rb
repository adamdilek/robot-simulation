module Commands
  class Left < Base
    def execute
      @robot.turn_left
    end
  end

  Commands::Base.register_command(Commands::Left.identifier, Commands::Left)
end
