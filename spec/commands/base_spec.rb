describe Commands::Base do
  it 'does not set identifier' do
    klass = Commands::Base

    expect(klass.identifier).to eq('BASE')
  end

  it 'executes a command' do
    robot = Robot.new

    klass = Commands::Base.new(robot, 'ANY COMMAND')

    expect { klass.execute }.to raise_error(CustomErrors::MustBeImplemented)
  end

  it 'register a command class which is not extended from Command::Base' do
    klass = Commands::Base

    klass.register_command('FINDME', Array)

    expect(klass::REGISTERED_COMMANDS.keys).not_to include('FINDME')
  end

  it 'does not register a command class which is extended from Command::Base' do

    class DUMMY < Commands::Base
    end

    klass = Commands::Base

    klass.register_command('DUMMY', DUMMY)

    expect(klass::REGISTERED_COMMANDS.keys).to include('DUMMY')
  end
end
