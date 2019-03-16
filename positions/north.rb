module Positions
  class NORTH < Base
    class << self
      def right
        Positions::EAST
      end

      def left
        Positions::WEST
      end

      def forward
        1
      end

      def plane_position
        'y'
      end
    end
  end

  Position.register_position(Positions::NORTH.identifier, Positions::NORTH)
end
