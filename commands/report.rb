module Commands
  class Report < Base
    def execute
      "Output: #{@robot.position.x}, #{@robot.position.y}, #{@robot.position.f.identifier}"
    end
  end

  Commands::Base.register_command(Commands::Report.identifier, Commands::Report)
end
