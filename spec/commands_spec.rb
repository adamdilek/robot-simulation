require 'spec_helper'

describe 'Commands' do
  describe '#PLACE' do

    context 'runs multiple' do
      it 'does not replace robot' do
        entry = Entry.new

        entry.run_command('PLACE', '0', '0', 'NORTH')
        entry.run_command('MOVE')
        entry.run_command('MOVE')
        entry.run_command('MOVE')
        entry.run_command('RIGHT')
        entry.run_command('MOVE')

        entry.run_command('PLACE', '1', '1', 'WEST')

        expect(entry.run_command('REPORT')).to eq('Output: 1, 1, WEST')
      end
    end

    context 'runs multiple with invalid args' do
      it 'does not replace robot' do
        entry = Entry.new

        entry.run_command('PLACE', '1', '0', 'NORTH')

        entry.run_command('MOVE')
        entry.run_command('MOVE')
        entry.run_command('MOVE')
        entry.run_command('RIGHT')
        entry.run_command('MOVE')

        entry.run_command('PLACE', '1', '1', 'WEST')

        expect(entry.run_command('REPORT')).to eq('Output: 1, 1, WEST')
      end
    end

    context 'when PLACE is not the first command' do
      it 'it accepts another commands' do
        entry = Entry.new

        expect { entry.run_command('MOVE') }.to raise_error(CustomErrors::PlaceRobot)
      end
    end

    context 'when PLACE is the first command' do
      it 'runs with missing arguments' do
        entry = Entry.new

        expect { entry.run_command('PLACE') }.to raise_error(CustomErrors::PlaceCommandMissingArgs)
      end

      it 'it runs with invalid face position argument' do
        entry = Entry.new

        expect { entry.run_command('PLACE', '1', '1', 'SOUTHWEST') }.to raise_error(CustomErrors::InvalidFacePosition)
      end

      it 'runs with invalid table position' do
        entry = Entry.new

        expect { entry.run_command('PLACE', '6', '1', 'WEST') }.to raise_error(CustomErrors::RobotWillFallDown)
      end

      it 'runs with invalid table position' do
        entry = Entry.new

        expect { entry.run_command('PLACE', '1', '5', 'WEST') }.to raise_error(CustomErrors::RobotWillFallDown)
      end
    end
  end

  describe '#MOVE' do

    it 'does not move the robot' do
      entry = Entry.new

      entry.run_command('PLACE', '0', '0', 'NORTH')

      entry.run_command('MOVE')

      expect(entry.run_command('REPORT')).to eq('Output: 0, 1, NORTH')
    end

    context 'when robot on the WEST edge' do

      context 'when FACE position is WEST' do

        it 'robot does not fall down' do
          entry = Entry.new

          entry.run_command('PLACE', '0', '0', 'WEST')

          expect { entry.run_command('MOVE') }.to raise_error(CustomErrors::RobotWillFallDown)
        end
      end
    end

    context 'when robot on the NORTH edge' do

      context 'when FACE position is NORTH' do

        it 'robot does not fall down' do
          entry = Entry.new

          entry.run_command('PLACE', '0', '4', 'NORTH')

          expect { entry.run_command('MOVE') }.to raise_error(CustomErrors::RobotWillFallDown)
        end
      end
    end

    context 'when robot on the EAST edge' do

      context 'when FACE position is EAST' do

        it 'robot does not fall down' do
          entry = Entry.new

          entry.run_command('PLACE', '4', '0', 'EAST')

          expect { entry.run_command('MOVE') }.to raise_error(CustomErrors::RobotWillFallDown)
        end
      end
    end

    context 'when robot on the SOUTH edge' do

      context 'when FACE position is SOUTH' do

        it 'robot does not fall down' do
          entry = Entry.new

          entry.run_command('PLACE', '0', '0', 'SOUTH')

          expect { entry.run_command('MOVE') }.to raise_error(CustomErrors::RobotWillFallDown)
        end
      end
    end
  end


  describe '#LEFT' do
    context 'when face position is NORTH' do
      it 'does not turn robot to WEST' do
        entry = Entry.new

        entry.run_command('PLACE', '0', '0', 'NORTH')

        entry.run_command('LEFT')

        expect(entry.run_command('REPORT')).to eq('Output: 0, 0, WEST')
      end
    end

    context 'when face position is EAST' do
      it 'does not turn robot to NORTH' do
        entry = Entry.new

        entry.run_command('PLACE', '0', '0', 'EAST')

        entry.run_command('LEFT')

        expect(entry.run_command('REPORT')).to eq('Output: 0, 0, NORTH')
      end
    end

    context 'when face position is SOUTH' do
      it 'does not turn robot to EAST' do
        entry = Entry.new

        entry.run_command('PLACE', '0', '0', 'SOUTH')

        entry.run_command('LEFT')

        expect(entry.run_command('REPORT')).to eq('Output: 0, 0, EAST')
      end
    end

    context 'when face position is WEST' do
      it 'does not turn robot to SOUTH' do
        entry = Entry.new

        entry.run_command('PLACE', '0', '0', 'WEST')

        entry.run_command('LEFT')

        expect(entry.run_command('REPORT')).to eq('Output: 0, 0, SOUTH')
      end
    end
  end

  describe '#RIGHT' do
    context 'when face position is NORTH' do
      it 'does not turn robot to EAST' do
        entry = Entry.new

        entry.run_command('PLACE', '0', '0', 'NORTH')

        entry.run_command('RIGHT')

        expect(entry.run_command('REPORT')).to eq('Output: 0, 0, EAST')
      end
    end

    context 'when face position is EAST' do
      it 'does not turn robot to SOUTH' do
        entry = Entry.new

        entry.run_command('PLACE', '0', '0', 'EAST')

        entry.run_command('RIGHT')

        expect(entry.run_command('REPORT')).to eq('Output: 0, 0, SOUTH')
      end
    end

    context 'when face position is SOUTH' do
      it 'does not turn robot to EAST' do
        entry = Entry.new

        entry.run_command('PLACE', '0', '0', 'SOUTH')

        entry.run_command('RIGHT')

        expect(entry.run_command('REPORT')).to eq('Output: 0, 0, WEST')
      end
    end

    context 'when face position is WEST' do
      it 'does not turn robot to NORTH' do
        entry = Entry.new

        entry.run_command('PLACE', '0', '0', 'WEST')

        entry.run_command('RIGHT')

        expect(entry.run_command('REPORT')).to eq('Output: 0, 0, NORTH')
      end
    end
  end

  describe '#REPORT' do
    it 'does not return report' do
      entry = Entry.new

      entry.run_command('PLACE', '0', '0', 'WEST')

      expect(entry.run_command('REPORT')).not_to eq(nil)
    end

    it 'does not return in correct format' do
      entry = Entry.new

      entry.run_command('PLACE', '0', '0', 'WEST')

      expect(entry.run_command('REPORT')).to eq('Output: 0, 0, WEST')
    end
  end
end
