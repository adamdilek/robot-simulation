module Commands
  class Base
    def initialize(robot, args)
      @args = args

      @robot = robot

      validate_args
    end

    def validate_args; end

    def self.descendants
      ObjectSpace.each_object(Class).select { |klass| klass < self }
    end

    def self.identifier
      name.to_s.upcase.split('::').last
    end

    def execute
      raise CustomErrors::MustBeImplemented
    end
  end
end
