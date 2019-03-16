require './commander'
require './position'
require './table'
require './robot'

Dir[File.join(__dir__, 'commands', '*.rb')].each { |file| require file }

class Entry
  def initialize
    @robot = MainRobot.new
    @inputs = []
  end

  def add_command(*commands)
    commander = Commander.new(@robot, commands)

    if (@inputs.size.zero? && place_command?(commander.command)) || @inputs.size.positive?
      @inputs << commander.command
      commander.run
    else
      raise CustomErrors::PlaceRobot
    end
  end

  private

  def place_command?(command)
    command == Commands::Place.identifier
  end
end