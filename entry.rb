require './commander'
require './position'
require './table'
require './robot'
require './custom_errors'

Dir[File.join(__dir__, 'commands', '*.rb')].each { |file| require file }
Dir[File.join(__dir__, 'directions', '*.rb')].each { |file| require file }

class Entry
  def initialize
    @robot = Robot.new
    @inputs = []
  end

  def run_command(*commands)
    commander = Commander.new(@robot, commands)

    return CustomErrors::PlaceRobot.new.message unless robot_placed?(commander.command)

    begin
      result = commander.run

      @inputs << commander.command

      result
    rescue StandardError => ex
      ex.message
    end
  end

  private

  def robot_placed?(command)
    (@inputs.size.zero? && place_command?(command)) || @inputs.size.positive?
  end

  def place_command?(command)
    command == Commands::Place.identifier
  end
end