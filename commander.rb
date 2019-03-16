class Commander
  attr_reader :command

  def initialize(robot, commands)
    @command = commands.first

    @robot = robot

    @args = commands[1..commands.size]
  end

  def run
    klass = Commands::Base::REGISTERED_COMMANDS[@command]

    raise CustomErrors::InvalidCommand if klass.nil?

    klass.new(@robot, @args).execute
  end
end