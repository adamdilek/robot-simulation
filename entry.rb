require './commander'
require './position'
require './table'
require './robot'
require './custom_errors'

Dir[File.join(__dir__, 'commands', '*.rb')].each { |file| require file }
Dir[File.join(__dir__, 'positions', '*.rb')].each { |file| require file }

class Entry
  def initialize
    @robot = Robot.new
    @inputs = []
  end

  def run_command(*commands)
    commander = Commander.new(@robot, commands)

    if (@inputs.size.zero? && place_command?(commander.command)) || @inputs.size.positive?
      result = commander.run

      @inputs << commander.command

      result
    else
      raise CustomErrors::PlaceRobot
    end
  end

  private

  def place_command?(command)
    command == Commands::Place.identifier
  end
end