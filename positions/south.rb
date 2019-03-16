module Positions
  class SOUTH < Base
    class << self
      def right
        Positions::WEST
      end

      def left
        Positions::EAST
      end

      def forward
        -1
      end

      def plane_position
        'y'
      end
    end
  end

  Position.register_position(Positions::SOUTH.identifier, Positions::SOUTH)
end
