require 'spec_helper'

describe 'Engine' do
  describe '#PLACE' do

    context 'runs multiple' do
      it 'does not replace robot' do
        engine = Engine.new

        engine.run_command('PLACE', '0', '0', 'NORTH')
        engine.run_command('MOVE')
        engine.run_command('MOVE')
        engine.run_command('MOVE')
        engine.run_command('RIGHT')
        engine.run_command('MOVE')

        engine.run_command('PLACE', '1', '1', 'WEST')

        expect(engine.run_command('REPORT')).to eq('Output: 1, 1, WEST')
      end
    end

    context 'runs multiple with invalid args' do
      it 'does not replace robot' do
        engine = Engine.new

        engine.run_command('PLACE', '1', '0', 'NORTH')

        engine.run_command('MOVE')
        engine.run_command('MOVE')
        engine.run_command('MOVE')
        engine.run_command('RIGHT')
        engine.run_command('MOVE')

        engine.run_command('PLACE', '1', '1', 'WEST')

        expect(engine.run_command('REPORT')).to eq('Output: 1, 1, WEST')
      end
    end

    context 'when PLACE is not the first command' do
      it 'it accepts another commands' do
        engine = Engine.new

        expect { engine.run_command('MOVE') }.to raise_error(CustomErrors::PlaceRobot)
      end
    end

    context 'when PLACE is the first command' do
      it 'runs with missing arguments' do
        engine = Engine.new

        expect { engine.run_command('PLACE') }.to raise_error(CustomErrors::PlaceCommandMissingArgs)
      end

      it 'it runs with invalid face position argument' do
        engine = Engine.new

        expect { engine.run_command('PLACE', '1', '1', 'SOUTHWEST') }.to raise_error(CustomErrors::InvalidFaceDirection)
      end

      it 'runs with invalid table position' do
        engine = Engine.new

        expect { engine.run_command('PLACE', '6', '1', 'WEST') }.to raise_error(CustomErrors::RobotWillFallDown)
      end

      it 'runs with invalid table position' do
        engine = Engine.new

        expect { engine.run_command('PLACE', '1', '5', 'WEST')}.to raise_error(CustomErrors::RobotWillFallDown)
      end
    end
  end

  describe '#MOVE' do

    it 'does not move the robot' do
      engine = Engine.new

      engine.run_command('PLACE', '0', '0', 'NORTH')

      engine.run_command('MOVE')

      expect(engine.run_command('REPORT')).to eq('Output: 0, 1, NORTH')
    end

    context 'when robot on the WEST edge' do

      context 'when FACE position is WEST' do

        it 'robot does not fall down' do
          engine = Engine.new

          engine.run_command('PLACE', '0', '0', 'WEST')

          expect { engine.run_command('MOVE') }.to raise_error(CustomErrors::RobotWillFallDown)
        end
      end
    end

    context 'when robot on the NORTH edge' do

      context 'when FACE position is NORTH' do

        it 'robot does not fall down' do
          engine = Engine.new

          engine.run_command('PLACE', '0', '4', 'NORTH')

          expect { engine.run_command('MOVE') }.to raise_error(CustomErrors::RobotWillFallDown)
        end
      end
    end

    context 'when robot on the EAST edge' do

      context 'when FACE position is EAST' do

        it 'robot does not fall down' do
          engine = Engine.new

          engine.run_command('PLACE', '4', '0', 'EAST')

          expect { engine.run_command('MOVE') }.to raise_error(CustomErrors::RobotWillFallDown)
        end
      end
    end

    context 'when robot on the SOUTH edge' do

      context 'when FACE position is SOUTH' do

        it 'robot does not fall down' do
          engine = Engine.new

          engine.run_command('PLACE', '0', '0', 'SOUTH')

          expect { engine.run_command('MOVE') }.to raise_error(CustomErrors::RobotWillFallDown)
        end
      end
    end
  end


  describe '#LEFT' do
    context 'when face position is NORTH' do
      it 'does not turn robot to WEST' do
        engine = Engine.new

        engine.run_command('PLACE', '0', '0', 'NORTH')

        engine.run_command('LEFT')

        expect(engine.run_command('REPORT')).to eq('Output: 0, 0, WEST')
      end
    end

    context 'when face position is EAST' do
      it 'does not turn robot to NORTH' do
        engine = Engine.new

        engine.run_command('PLACE', '0', '0', 'EAST')

        engine.run_command('LEFT')

        expect(engine.run_command('REPORT')).to eq('Output: 0, 0, NORTH')
      end
    end

    context 'when face position is SOUTH' do
      it 'does not turn robot to EAST' do
        engine = Engine.new

        engine.run_command('PLACE', '0', '0', 'SOUTH')

        engine.run_command('LEFT')

        expect(engine.run_command('REPORT')).to eq('Output: 0, 0, EAST')
      end
    end

    context 'when face position is WEST' do
      it 'does not turn robot to SOUTH' do
        engine = Engine.new

        engine.run_command('PLACE', '0', '0', 'WEST')

        engine.run_command('LEFT')

        expect(engine.run_command('REPORT')).to eq('Output: 0, 0, SOUTH')
      end
    end
  end

  describe '#RIGHT' do
    context 'when face position is NORTH' do
      it 'does not turn robot to EAST' do
        engine = Engine.new

        engine.run_command('PLACE', '0', '0', 'NORTH')

        engine.run_command('RIGHT')

        expect(engine.run_command('REPORT')).to eq('Output: 0, 0, EAST')
      end
    end

    context 'when face position is EAST' do
      it 'does not turn robot to SOUTH' do
        engine = Engine.new

        engine.run_command('PLACE', '0', '0', 'EAST')

        engine.run_command('RIGHT')

        expect(engine.run_command('REPORT')).to eq('Output: 0, 0, SOUTH')
      end
    end

    context 'when face position is SOUTH' do
      it 'does not turn robot to EAST' do
        engine = Engine.new

        engine.run_command('PLACE', '0', '0', 'SOUTH')

        engine.run_command('RIGHT')

        expect(engine.run_command('REPORT')).to eq('Output: 0, 0, WEST')
      end
    end

    context 'when face position is WEST' do
      it 'does not turn robot to NORTH' do
        engine = Engine.new

        engine.run_command('PLACE', '0', '0', 'WEST')

        engine.run_command('RIGHT')

        expect(engine.run_command('REPORT')).to eq('Output: 0, 0, NORTH')
      end
    end
  end

  describe '#REPORT' do
    it 'does not return report' do
      engine = Engine.new

      engine.run_command('PLACE', '0', '0', 'WEST')

      expect(engine.run_command('REPORT')).not_to eq(nil)
    end

    it 'does not return in correct format' do
      engine = Engine.new

      engine.run_command('PLACE', '0', '0', 'WEST')

      expect(engine.run_command('REPORT')).to eq('Output: 0, 0, WEST')
    end
  end
end
