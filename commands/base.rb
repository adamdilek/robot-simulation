module Commands
  class Base

    REGISTERED_COMMANDS = {}

    def initialize(robot, args = [])
      @args = args

      @robot = robot

      validate_args
    end

    def validate_args; end

    def self.identifier
      name.to_s.upcase.split('::').last
    end

    def execute
      raise CustomErrors::MustBeImplemented
    end

    def self.register_command(command, klass)
      REGISTERED_COMMANDS[command] = klass if klass.superclass == Commands::Base
    end
  end
end
