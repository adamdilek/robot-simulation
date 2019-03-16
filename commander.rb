class Commander
  attr_reader :command

  def initialize(robot, commands)
    @command = commands.first

    @robot = robot

    @args = commands[1..commands.size]
  end

  def run
    klass = command_klass(@command)

    raise CustomErrors::InvalidCommand if klass.nil?

    klass.new(@robot, @args).execute
  end

  def command_klass(identifier)
    Commands::Base.descendants.each do |kl|
      return kl if kl.identifier == identifier
    end

    nil
  end
end